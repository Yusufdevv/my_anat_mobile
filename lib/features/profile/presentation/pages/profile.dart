import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/delete_account_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/get_profile.dart';
import 'package:anatomica/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:anatomica/features/profile/presentation/pages/favorites.dart';
import 'package:anatomica/features/profile/presentation/pages/help.dart';
import 'package:anatomica/features/profile/presentation/pages/safety.dart';
import 'package:anatomica/features/profile/presentation/pages/setting.dart';
import 'package:anatomica/features/profile/presentation/widgets/logout_dialog.dart';
import 'package:anatomica/features/profile/presentation/widgets/other_profile_item.dart';
import 'package:anatomica/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:anatomica/features/profile/presentation/widgets/profile_card.dart';
import 'package:anatomica/features/profile/presentation/widgets/profile_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with TickerProviderStateMixin {
  late ImagePicker imagePicker;
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    imagePicker = ImagePicker();
    _profileBloc = ProfileBloc(
        getProfileUseCase: GetProfileUseCase(profileRepository: serviceLocator<ProfileRepositoryImpl>()),
        deleteAccountUsecase: DeleteAccountUseCase(repository: serviceLocator<ProfileRepositoryImpl>()))
      ..add(GetProfileEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider.value(
        value: _profileBloc,
        child: Scaffold(
          appBar: const PreferredSize(
            preferredSize: Size.fromHeight(64),
            child: ProfileAppBar(),
          ),
          body: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (context, state) {
              if (state.getProfileStatus.isSubmissionInProgress) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              } else if (state.getProfileStatus.isSubmissionSuccess) {
                return ListView(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 20 + mediaQuery.padding.bottom),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ProfileCard(
                      user: state.profileEntity,
                    ),
                    const SizedBox(height: 16),
                    if (state.profileEntity.isDoctor) ...{
                      ProfileItem(title: LocaleKeys.doctor_office.tr(), icon: AppIcons.scope, onTap: () {}),
                    },
                    if (state.profileEntity.isOrganization) ...{
                      ProfileItem(
                          title: LocaleKeys.organization_office.tr(), image: AppImages.organization, onTap: () {}),
                    },
                    const SizedBox(height: 12),
                    ProfileItem(
                        title: LocaleKeys.setting.tr(),
                        icon: AppIcons.setting,
                        onTap: () {
                          Navigator.of(context).push(
                            fade(
                              page: const SettingScreen(),
                            ),
                          );
                        }),
                    const SizedBox(height: 12),
                    ProfileItem(
                        title: LocaleKeys.safety.tr(),
                        icon: AppIcons.lock,
                        onTap: () {
                          Navigator.of(context).push(fade(
                              page: SafetyScreen(
                            profileBloc: context.read<ProfileBloc>(),
                          )));
                        }),
                    const SizedBox(height: 12),
                    ProfileItem(
                        title: LocaleKeys.favorite.tr(),
                        icon: AppIcons.profileStar,
                        onTap: () {
                          Navigator.of(context).push(fade(page: const FavoritesScreen()));
                        }),
                    const SizedBox(height: 12),
                    ProfileItem(
                        title: LocaleKeys.help.tr(),
                        icon: AppIcons.help,
                        onTap: () {
                          Navigator.of(context, rootNavigator: true).push(fade(page: const HelpScreen()));
                        }),
                    const SizedBox(height: 12),
                    const WDivider(),
                    const SizedBox(height: 12),
                    ProfileItem(
                        title: LocaleKeys.sing_out.tr(),
                        icon: AppIcons.logout,
                        onTap: () {
                          showLogOutDialog(context,
                              onConfirmTap: () => context
                                  .read<AuthenticationBloc>()
                                  .add(AuthenticationStatusChanged(status: AuthenticationStatus.unauthenticated)));
                        },
                        color: snow),
                    const SizedBox(height: 24),
                    if (state.profileEntity.isDoctor || state.profileEntity.isOrganization) ...{
                      const SizedBox()
                    } else ...{
                      Column(
                        children: [
                          const OtherProfileItem(),
                          const SizedBox(height: 12),
                          OtherProfileItem(
                            iconBackgroundColor: steelBlue,
                            icon: AppIcons.icHospital,
                            backgroundColor: pattensBlue,
                            title: LocaleKeys.get_organization.tr(),
                          ),
                        ],
                      )
                    }
                  ],
                );
              } else if (state.getProfileStatus.isSubmissionFailure) {
                return const Center(
                  child: Text('Error'),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ));
  }
}
