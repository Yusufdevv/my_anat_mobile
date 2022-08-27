import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/show_cupertino_date_picker.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/edit_profile.dart';
import 'package:anatomica/features/profile/domain/usecases/upload_img.dart';
import 'package:anatomica/features/profile/prezentation/blocs/edit_profile_bloc/edit_profile_bloc.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_image.dart';
import 'package:anatomica/features/profile/prezentation/widgets/upload_image_cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  late TextEditingController nameController;
  late TextEditingController soNameController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  DateTime date = DateTime.now();
  late EditProfileBloc editBloc;
  late ImagePicker imagePicker;

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
    imagePicker = ImagePicker();
    nameController = TextEditingController(text: 'Мухаммадамин');
    soNameController = TextEditingController(text: 'Домлахонов');
    phoneController = TextEditingController(text: '+998 91 120 20 86');
    emailController = TextEditingController(text: 'domlahonov@gmail.com');
    editBloc = EditProfileBloc(
        EditProfileUseCase(
            repository:
                ProfileRepositoryImpl(profileDatasource: serviceLocator())),
        UploadImageUseCase(
            profileRepository:
                ProfileRepositoryImpl(profileDatasource: serviceLocator())));
    super.initState();
  }

  @override
  dispose() {
    nameController.dispose();
    soNameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    editBloc.close();
    super.dispose();
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
    return BlocProvider.value(
      value: editBloc,
      child: KeyboardDismisser(
        child: Scaffold(
          appBar: const WAppBar(title: 'Редактировать'),
          bottomNavigationBar: WButton(
            margin:
                EdgeInsets.fromLTRB(16, 0, 16, 12 + mediaQuery.padding.bottom),
            text: 'Сохранить',
            onTap: () {
              editBloc.add(EditProfileEvent.saveData());
              Navigator.pop(context);
            },
          ),
          body: BlocBuilder<EditProfileBloc, EditProfileState>(
            builder: (context, state) {
              if (state.status.isPure) {
                context
                    .read<EditProfileBloc>()
                    .add(EditProfileEvent.saveData());
              }
              if (state.status == FormzStatus.submissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.status == FormzStatus.submissionSuccess) {
                return SingleChildScrollView(
                  padding: EdgeInsets.fromLTRB(
                      16, 24, 16, 12 + mediaQuery.padding.bottom),
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WScaleAnimation(
                            onTap: () {
                              _showPickerIos(context);
                            },
                            child: SizedBox(
                              height: 104,
                              child: Stack(
                                children: [
                                  const ProfileImage(),
                                  Positioned(
                                    bottom: 0,
                                    right: 34,
                                    child: Container(
                                      padding: const EdgeInsets.all(4),
                                      height: 24,
                                      width: 24,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: primary,
                                      ),
                                      child:
                                          SvgPicture.asset(AppIcons.editImage),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 28),
                      DefaultTextField(
                        controller: nameController,
                        onChanged: (v) {},
                        title: 'Имя',
                        prefix: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                          child:
                              SvgPicture.asset(AppIcons.user, color: primary),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DefaultTextField(
                        controller: soNameController,
                        onChanged: (v) {},
                        title: 'Фамилия',
                        prefix: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                          child:
                              SvgPicture.asset(AppIcons.user, color: primary),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DefaultTextField(
                        controller: phoneController,
                        onChanged: (v) {},
                        title: 'Номер телефона',
                        prefix: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                          child:
                              SvgPicture.asset(AppIcons.phone, color: primary),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DefaultTextField(
                        controller: emailController,
                        onChanged: (v) {},
                        title: 'Email',
                        prefix: Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10, 8, 10),
                          child: SvgPicture.asset(AppIcons.at, color: primary),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Дата рождения',
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () {
                          showCupertinoDatePicker(context, (date) {
                            setState(() {
                              this.date = date;
                            });
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 8, 12, 8),
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: lilyWhite,
                          ),
                          child: Row(
                            children: [
                              Text(
                                MyFunctions.formatBirthDate(date),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1!
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
                  ),
                );
              } else if (state.status == FormzStatus.submissionFailure) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
