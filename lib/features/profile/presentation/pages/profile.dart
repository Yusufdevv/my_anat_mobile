import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/auth/presentation/pages/register.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/delete_account_usecase.dart';
import 'package:anatomica/features/profile/domain/usecases/get_profile.dart';
import 'package:anatomica/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:anatomica/features/profile/presentation/pages/favorites.dart';
import 'package:anatomica/features/profile/presentation/pages/help.dart';
import 'package:anatomica/features/profile/presentation/pages/my_cards.dart';
import 'package:anatomica/features/profile/presentation/pages/purchased_screen.dart';
import 'package:anatomica/features/profile/presentation/pages/safety.dart';
import 'package:anatomica/features/profile/presentation/pages/setting.dart';
import 'package:anatomica/features/profile/presentation/widgets/guest_card.dart';
import 'package:anatomica/features/profile/presentation/widgets/logout_dialog.dart';
import 'package:anatomica/features/profile/presentation/widgets/other_profile_item.dart';
import 'package:anatomica/features/profile/presentation/widgets/profile_card.dart';
import 'package:anatomica/features/profile/presentation/widgets/profile_item.dart';
import 'package:anatomica/features/web_view/web_view_screen.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
        create: (context) => ProfileBloc(
            getProfileUseCase: GetProfileUseCase(
                profileRepository: serviceLocator<ProfileRepositoryImpl>()),
            deleteAccountUsecase: DeleteAccountUseCase(
                repository: serviceLocator<ProfileRepositoryImpl>()))
          ..add(GetProfileEvent()),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: white,
            leadingWidth: 0,
            leading: const SizedBox(width: 0),
            elevation: 0.2,
            title: Row(
              children: [
                const SizedBox(width: 0),
                SvgPicture.asset(AppIcons.logo, color: black),
                const SizedBox(width: 12),
                Text(
                  LocaleKeys.account.tr(),
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                )
              ],
            ),
          ),
          body: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              if (state.status == AuthenticationStatus.unauthenticated) {
                return ListView(
                  padding: EdgeInsets.fromLTRB(
                      16, 16, 16, 20 + mediaQuery.padding.bottom),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    const GuestCard(),
                    const SizedBox(height: 12),
                    ProfileItem(
                        title: LocaleKeys.setting,
                        icon: AppIcons.setting,
                        onTap: () {
                          Navigator.of(context).push(
                            fade(
                              page: const SettingScreen(),
                            ),
                          );
                        }),
                    const SizedBox(height: 12),
                    // ProfileItem(
                    //     title: LocaleKeys.purchased,
                    //     icon: AppIcons.purchased,
                    //     onTap: () {
                    //       Navigator.of(context, rootNavigator: true)
                    //           .push(fade(page: const PurchasedScreen()));
                    //     }),
                    // const SizedBox(height: 12),
                    ProfileItem(
                        title: LocaleKeys.help,
                        icon: AppIcons.help,
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .push(fade(page: const HelpScreen()));
                        }),
                    const SizedBox(height: 12),
                    const WDivider(),
                    const SizedBox(height: 12),
                    ProfileItem(
                      titleColor: primary,
                      iconColor: primary,
                      title: LocaleKeys.za_register,
                      icon: AppIcons.logout,
                      onTap: () {
                        Navigator.of(context, rootNavigator: true).push(
                          fade(
                            page: const RegisterScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                );
              } else {
                return BlocBuilder<ProfileBloc, ProfileState>(
                  builder: (context, state) {
                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<ProfileBloc>().add(GetProfileEvent());
                        return await Future.delayed(
                            const Duration(milliseconds: 1000));
                      },
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                            16, 16, 16, 20 + mediaQuery.padding.bottom),
                        physics: const BouncingScrollPhysics(),
                        children: [
                          ProfileCard(
                            user: state.profileEntity,
                            status: state.getProfileStatus,
                          ),
                          const SizedBox(height: 16),
                          if (state.profileEntity.doctor.id != 0) ...{
                            ProfileItem(
                                title: LocaleKeys.doctor_office,
                                icon: AppIcons.scope,
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .push(
                                    fade(
                                      page: const WebViewScreen(
                                        page: 'CabinetDoctorAboutPage',
                                      ),
                                    ),
                                  );
                                }),
                          },
                          if (state.profileEntity.organizations.isNotEmpty) ...{
                            ProfileItem(
                              title: LocaleKeys.organization_office,
                              image: AppImages.organization,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  fade(
                                    page: const WebViewScreen(
                                      page: 'CabinetOrganizationAboutPage',
                                    ),
                                  ),
                                );
                              },
                            ),
                          },
                          const SizedBox(height: 12),
                          ProfileItem(
                              title: LocaleKeys.setting,
                              icon: AppIcons.setting,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  fade(
                                    page: const SettingScreen(),
                                  ),
                                );
                              }),
                          const SizedBox(height: 12),
                          ProfileItem(
                              title: LocaleKeys.safety,
                              icon: AppIcons.lock,

                              onTap: () {
                                Navigator.of(context,  rootNavigator: true).push(fade(
                                    page: SafetyScreen(
                                  profileBloc: context.read<ProfileBloc>(),
                                )));
                              }),
                          const SizedBox(height: 12),
                          ProfileItem(
                            iconColor: darkGreen,
                              title: LocaleKeys.my_cards,
                              icon: AppIcons.creditCard,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page:   MyCardsScreen()));
                              }),
                          const SizedBox(height: 12),
                          ProfileItem(
                              title: LocaleKeys.favorite,
                              icon: AppIcons.profileStar,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page: const FavoritesScreen()));
                              }),
                          const SizedBox(height: 12),
                          ProfileItem(
                              title: LocaleKeys.purchased,
                              icon: AppIcons.purchased,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page: const PurchasedScreen()));
                              }),
                          const SizedBox(height: 12),
                          ProfileItem(
                              title: LocaleKeys.help,
                              icon: AppIcons.help,
                              onTap: () {
                                Navigator.of(context, rootNavigator: true)
                                    .push(fade(page: const HelpScreen()));
                              }),
                          const SizedBox(height: 12),
                          const WDivider(),
                          const SizedBox(height: 12),
                          ProfileItem(
                              title: LocaleKeys.sing_out,
                              icon: AppIcons.logout,
                              onTap: () {
                                showLogOutDialog(context,
                                    onConfirmTap: () => context
                                        .read<AuthenticationBloc>()
                                        .add(AuthenticationStatusChanged(
                                            status: AuthenticationStatus
                                                .unauthenticated)));
                              },
                              color: snow),
                          const SizedBox(height: 24),
                          // if (state.profileEntity.doctor.id != 0 ||
                          //     state.profileEntity.organizations.isNotEmpty) ...{
                          //   const SizedBox()
                          // } else ...{
                          Offstage(
                            offstage: state.profileEntity.isDoctor ||
                                state.profileEntity.isOrganization,
                            child: Column(
                              children: [
                                OtherProfileItem(
                                  onTap: () async {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(fade(
                                            page: const WebViewScreen(
                                      page: 'CreateDoctorPage',
                                    )));
                                  },
                                ),
                                const SizedBox(height: 12),
                                OtherProfileItem(
                                  onTap: () async {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(
                                      fade(
                                        page: const WebViewScreen(
                                          page: 'CreateOrganizationPage',
                                        ),
                                      ),
                                    );
                                  },
                                  iconBackgroundColor: steelBlue,
                                  icon: AppIcons.icHospital,
                                  backgroundColor: pattensBlue,
                                  title: LocaleKeys.get_organization.tr(),
                                ),
                              ],
                            ),
                          )
                          // }
                        ],
                      ),
                    );
                  },
                );
              }
            },
          ),
        ));
  }
}
