import 'dart:async';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/auth/domain/entities/user_entity.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/custom_screen.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/phone_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/show_cupertino_date_picker.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/edit_profile.dart';
import 'package:anatomica/features/profile/domain/usecases/restore.dart';
import 'package:anatomica/features/profile/domain/usecases/send_code_to_email_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/send_code_to_phone_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/send_verify_code.dart';
import 'package:anatomica/features/profile/domain/usecases/upload_img.dart';
import 'package:anatomica/features/profile/domain/usecases/verify_restore.dart';
import 'package:anatomica/features/profile/presentation/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:anatomica/features/profile/presentation/blocs/restore/restore_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/popups/components/refresh_panel.dart';
import 'package:anatomica/features/profile/presentation/widgets/profile_image.dart';
import 'package:anatomica/features/profile/presentation/widgets/upload_image_cupertino.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ProfileEditScreen extends StatefulWidget {
  final UserEntity userEntity;
  final ProfileBloc profileBloc;

  const ProfileEditScreen(
      {required this.userEntity, required this.profileBloc, Key? key})
      : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  late TextEditingController smsCodeController;
  DateTime date = DateTime.now();
  late EditProfileBloc editBloc;
  late ImagePicker imagePicker;
  late UserEntity _localUser;
  late StreamController<ErrorAnimationType> _errorController;
  late RestoreBloc restoreBloc;

  Future<String> getImage(bool isGallery) async {
    if (isGallery) {
      var photo = await imagePicker.pickImage(
          source: ImageSource.gallery, imageQuality: 100);
      return photo!.path;
    } else {
      var photo = await imagePicker.pickImage(
          source: ImageSource.camera, imageQuality: 100);
      return photo!.path;
    }
  }

  @override
  initState() {
    super.initState();
    imagePicker = ImagePicker();
    nameController = TextEditingController(
      text: widget.userEntity.fullName,
    );
    smsCodeController = TextEditingController();
    _errorController = StreamController<ErrorAnimationType>();
    _localUser = widget.userEntity;
    date = Jiffy(widget.userEntity.birthDay.isNotEmpty
            ? widget.userEntity.birthDay
            : DateTime(2000))
        .dateTime;
    phoneController = TextEditingController(
        text: MyFunctions.formatPhoneForInput(widget.userEntity.phoneNumber));
    emailController = TextEditingController(text: widget.userEntity.email);
    restoreBloc = RestoreBloc(
        sendRestore: SendRestoreCode(),
        verifyRestore: VerifyRestoreCode(),
        restore: RestoreUseCase());
    editBloc = EditProfileBloc(
        EditProfileUseCase(repository: serviceLocator<ProfileRepositoryImpl>()),
        UploadImageUseCase(
          profileRepository: serviceLocator<ProfileRepositoryImpl>(),
        ),
        SendCodeToEmailUseCase(
            repository: serviceLocator<ProfileRepositoryImpl>()),
        SendCodeToPhoneUseCase(
            repository: serviceLocator<ProfileRepositoryImpl>()));
  }

  Future<dynamic> _showPickerIos(BuildContext context) async {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => UpLoadImageCupertino(
        onTapCamera: () async {
          getImage(false).then((value) {
            editBloc.add(EditProfileEvent.changeImage(value));
            Navigator.pop(context);
          });
        },
        onTapGallery: () {
          getImage(true).then((value) {
            editBloc.add(EditProfileEvent.changeImage(value));
            Navigator.pop(context);
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: editBloc),
        BlocProvider.value(value: widget.profileBloc),
        BlocProvider.value(value: restoreBloc),
      ],
      child: CustomScreen(
        child: BlocBuilder<EditProfileBloc, EditProfileState>(
          builder: (context, state) {
            return BlocBuilder<RestoreBloc, RestoreState>(
              builder: (context, restoreState) {
                return BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
                  builder: (context, loginState) {
                    return Scaffold(
                        appBar: WAppBar(title: LocaleKeys.edit.tr()),
                        bottomNavigationBar: WButton(
                          margin: EdgeInsets.fromLTRB(
                              16, 0, 16, 12 + mediaQuery.padding.bottom),
                          text: LocaleKeys.save.tr(),
                          isLoading: state.status.isSubmissionInProgress,
                          onTap: () async {
                            if (phoneController.text.replaceAll(' ', '') !=
                                    widget.userEntity.phoneNumber
                                        .replaceAll('+998', '') ||
                                nameController.text !=
                                    widget.userEntity.fullName ||
                                emailController.text !=
                                    widget.userEntity.email) {
                              restoreBloc.add(
                                RestoreEvent.sendCode(
                                  phone:
                                      '+998${phoneController.text.replaceAll(' ', '')}',
                                  onSuccess: () async {
                                    await showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (context) => MultiBlocProvider(
                                        providers: [
                                          BlocProvider.value(
                                              value: restoreBloc),
                                        ],
                                        child: BlocBuilder<RestoreBloc,
                                            RestoreState>(
                                          builder: (context, restoreState) {
                                            return Dialog(
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12)),
                                              child: Container(
                                                width: double.maxFinite,
                                                padding:
                                                    const EdgeInsets.all(16),
                                                child: SingleChildScrollView(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            LocaleKeys.verify
                                                                .tr(),
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .headlineMedium!
                                                                .copyWith(
                                                                    color:
                                                                        black,
                                                                    fontSize:
                                                                        20),
                                                          ),
                                                          const Spacer(),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: SvgPicture
                                                                .asset(
                                                              AppIcons.close,
                                                              width: 24,
                                                              height: 24,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      Text(
                                                        LocaleKeys
                                                            .write_sent_code
                                                            .tr(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                                color:
                                                                    textSecondary),
                                                      ),
                                                      Container(
                                                        margin: const EdgeInsets
                                                                .symmetric(
                                                            vertical: 20),
                                                        decoration: BoxDecoration(
                                                            boxShadow: const [
                                                              BoxShadow(
                                                                  color: Color(
                                                                      0x292B8364),
                                                                  blurRadius:
                                                                      12,
                                                                  offset:
                                                                      Offset(
                                                                          0, 4))
                                                            ],
                                                            color: const Color(
                                                                0x1F43B7B1),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            border: Border.all(
                                                                color:
                                                                    primary)),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal: 10,
                                                                vertical: 6),
                                                        child: Text(
                                                          phoneController
                                                                  .text.isEmpty
                                                              ? '**************'
                                                              : '+998 ${phoneController.text.replaceRange(6, 11, '******')}',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .bodyLarge!
                                                              .copyWith(
                                                                  color: black),
                                                        ),
                                                      ),
                                                      Text(
                                                        LocaleKeys.write_code
                                                            .tr(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodyLarge!
                                                            .copyWith(
                                                                color: black),
                                                      ),
                                                      const SizedBox(
                                                          height: 12),
                                                      PinCodeTextField(
                                                        onChanged: (value) {},
                                                        controller:
                                                            smsCodeController,
                                                        errorAnimationController:
                                                            _errorController,
                                                        length: 6,
                                                        pinTheme: PinTheme(
                                                            inactiveFillColor:
                                                                const Color(
                                                                    0xffD9DBD9),
                                                            selectedColor:
                                                                primary,
                                                            selectedFillColor:
                                                                black,
                                                            inactiveColor:
                                                                const Color(
                                                                    0xffD9DBD9),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    8),
                                                            disabledColor:
                                                                const Color(
                                                                    0xffD9DBD9),
                                                            activeColor:
                                                                const Color(
                                                                    0xffD9DBD9),
                                                            activeFillColor:
                                                                black,
                                                            fieldHeight: 50,
                                                            fieldWidth: 42,
                                                            shape:
                                                                PinCodeFieldShape
                                                                    .box),
                                                        cursorColor: white,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        textStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .displaySmall!
                                                                .copyWith(
                                                                    fontSize:
                                                                        18),
                                                        hintStyle:
                                                            Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                    fontSize:
                                                                        4),
                                                        appContext: context,
                                                        showCursor: true,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                      ),
                                                      const RefreshPanel(),
                                                      const SizedBox(
                                                          height: 20),
                                                      WButton(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        onTap: () {
                                                          if (smsCodeController
                                                                  .text
                                                                  .length ==
                                                              6) {
                                                            context
                                                                .read<
                                                                    RestoreBloc>()
                                                                .add(RestoreEvent
                                                                    .verifyCode(
                                                                        code: smsCodeController
                                                                            .text,
                                                                        onSuccess:
                                                                            (signature) async {
                                                                          if (phoneController.text.replaceAll(' ', '') !=
                                                                              widget.userEntity.phoneNumber.replaceAll('+998',
                                                                                  '')) {
                                                                            editBloc.add(EditProfileEvent.changePhoneNumber('+998${phoneController.text.replaceAll(' ', '')}'));
                                                                          } else if (nameController.text !=
                                                                              widget
                                                                                  .userEntity.fullName) {
                                                                            editBloc.add(EditProfileEvent.changeName(nameController.text));
                                                                          } else if (emailController.text !=
                                                                              widget.userEntity.email) {
                                                                            editBloc.add(EditProfileEvent.changeEmail(emailController.text));
                                                                          }
                                                                          if (date.toString() !=
                                                                              widget.userEntity.birthDay) {
                                                                            editBloc.add(EditProfileEvent.changeDate('${date.year}-${date.month}-${date.day}'));
                                                                          }
                                                                          editBloc
                                                                              .add(
                                                                            EditProfileEvent.saveData(
                                                                              onSuccess: () {
                                                                                widget.profileBloc.add(
                                                                                  UpdateProfileEvent(
                                                                                    profileEntity: _localUser.copyWith(
                                                                                      birthDate: '${date.year}-${date.month}-${date.day}',
                                                                                      fullName: nameController.text,
                                                                                      phoneNumber: '+998${phoneController.text.replaceAll(' ', '')}',
                                                                                      email: emailController.text,
                                                                                      img: state.imageUrl.isNotEmpty ? ImageEntity(middle: state.imageUrl) : _localUser.img,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                                Navigator.pop(context);
                                                                              },
                                                                              onError: (message) {
                                                                                context.read<ShowPopUpBloc>().add(ShowPopUp(message: message));
                                                                              },
                                                                            ),
                                                                          );

                                                                          // context.read<RestoreBloc>().add(
                                                                          //             context
                                                                          //                 .read<
                                                                          //                 PurchasedJournalBloc>()
                                                                          //                 .add(
                                                                          //                 PurchasedJournalEvent
                                                                          //                     .getArticle(
                                                                          //                     isRefresh: false));
                                                                          //           } else {
                                                                          //             context
                                                                          //                 .read<
                                                                          //                 PurchasedArticleBloc>()
                                                                          //                 .add(
                                                                          //                 PurchasedArticleEvent
                                                                          //                     .getArticle(
                                                                          //                     isRefresh: false));
                                                                          //           }
                                                                          //           Navigator.pop(
                                                                          //               context);
                                                                          //         },
                                                                          //         signature: signature));
                                                                        },
                                                                        onError:
                                                                            (error) {
                                                                          _errorController
                                                                              .sink
                                                                              .add(ErrorAnimationType.shake);
                                                                        }));
                                                          } else {
                                                            _errorController
                                                                .sink
                                                                .add(
                                                                    ErrorAnimationType
                                                                        .shake);
                                                          }
                                                        },
                                                        height: 40,
                                                        borderRadius: 6,
                                                        text: LocaleKeys.next
                                                            .tr(),
                                                        textColor: white,
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            } else {
                              Navigator.pop(context);
                            }
                          },
                        ),
                        body: ListView(
                          padding: EdgeInsets.fromLTRB(
                              16, 24, 16, 12 + mediaQuery.padding.bottom),
                          physics: const BouncingScrollPhysics(),
                          children: [
                            Center(
                              child: WScaleAnimation(
                                onTap: () {
                                  _showPickerIos(context);
                                },
                                child: Stack(
                                  alignment: Alignment.bottomCenter,
                                  children: [
                                    const SizedBox(height: 104, width: 92),
                                    Positioned(
                                      top: 0,
                                      left: 0,
                                      right: 0,
                                      child: ProfileImage(
                                        url: state.imageUrl.isNotEmpty
                                            ? state.imageUrl
                                            : widget.userEntity.img.middle,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: primary,
                                        ),
                                        child: SvgPicture.asset(
                                            AppIcons.editImage),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 28),
                            DefaultTextField(
                              maxLines: 1,
                              controller: nameController,
                              onChanged: (v) {
                                context
                                    .read<EditProfileBloc>()
                                    .add(EditProfileEvent.changeName(v));
                              },
                              title: LocaleKeys.name.tr(),
                              prefix: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 8, 10),
                                child: SvgPicture.asset(AppIcons.user,
                                    color: primary),
                              ),
                            ),
                            const SizedBox(height: 16),
                            PhoneTextField(
                              onChanged: (value) {},
                              prefixIconColor: primary,
                              controller: phoneController,
                              title: LocaleKeys.phone_number.tr(),
                            ),
                            const SizedBox(height: 16),
                            DefaultTextField(
                              controller: emailController,
                              onChanged: (v) {
                                context
                                    .read<EditProfileBloc>()
                                    .add(EditProfileEvent.changeEmail(v));
                              },
                              title: LocaleKeys.mail.tr(),
                              hintText: 'example@anatomica.uz',
                              maxLines: 1,
                              prefix: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 10, 8, 10),
                                child: SvgPicture.asset(AppIcons.at,
                                    color: primary),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                LocaleKeys.birthday.tr(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 8),
                            GestureDetector(
                              onTap: () {
                                showCupertinoDatePicker(
                                  context,
                                  (date) {
                                    setState(() {
                                      this.date = date;
                                    });
                                    context.read<EditProfileBloc>().add(
                                        EditProfileEvent.changeDate(
                                            Jiffy(date).format('yyyy-MM-dd')));
                                  },
                                  DateTime(
                                    Jiffy(date).year,
                                    Jiffy(date).month,
                                    Jiffy(date).date,
                                  ),
                                );
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 8, 12, 8),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: lilyWhite,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      Jiffy(date).format('dd.MM.yyyy'),
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge!
                                          .copyWith(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    const Spacer(),
                                    SvgPicture.asset(AppIcons.calendar),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ));
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
