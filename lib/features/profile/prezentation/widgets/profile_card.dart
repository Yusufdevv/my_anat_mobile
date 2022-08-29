import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/get_profile.dart';
import 'package:anatomica/features/profile/prezentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:anatomica/features/profile/prezentation/pages/my_info.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard>
    with TickerProviderStateMixin {
  late ProfileBloc _profileBloc;

  @override
  void initState() {
    _profileBloc = ProfileBloc(
        getProfileUseCase: GetProfileUseCase(
            profileRepository:
                ProfileRepositoryImpl(profileDatasource: serviceLocator())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
        value: _profileBloc,
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.getProfileStatus.isPure) {
              context.read<ProfileBloc>().add(GetProfileEvent());
            }
            if (state.getProfileStatus == FormzStatus.submissionInProgress) {
              return const SizedBox(
                height: 80,
              );
            } else if (state.getProfileStatus ==
                FormzStatus.submissionSuccess) {
              return WScaleAnimation(
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(fade(page: const MyInfoScreen()));
                },
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: white,
                    border: Border.all(width: 1, color: persianIndigo),
                    boxShadow: [
                      BoxShadow(
                        color: darkerGreen.withOpacity(0.09),
                        offset: const Offset(0, 8),
                        blurRadius: 24,
                      )
                    ],
                  ),
                  child: Row(
                    children: [
                      ProfileImage(
                        height: 48,
                        width: 48,
                        url: state.profileEntity.img.middle,
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.profileEntity.fullName,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.headline1,
                              maxLines: 2,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      SvgPicture.asset(
                        AppIcons.arrowRight,
                        height: 20,
                        width: 20,
                      ),
                    ],
                  ),
                ),
              );
            } else if (state.getProfileStatus ==
                FormzStatus.submissionFailure) {
              return const Center(
                child: Text('Error'),
              );
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
