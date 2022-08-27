import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/get_profile.dart';
import 'package:anatomica/features/profile/prezentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:anatomica/features/profile/prezentation/pages/profile_edit.dart';
import 'package:anatomica/features/profile/prezentation/widgets/info_item.dart';
import 'package:anatomica/features/profile/prezentation/widgets/profile_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({Key? key}) : super(key: key);

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen>
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
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider.value(
      value: _profileBloc,
      child: Scaffold(
        appBar: const WAppBar(title: 'Мои данные', hasUnderline: true),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state.getProfileStatus.isPure) {
              context.read<ProfileBloc>().add(GetProfileEvent());
            }
            if (state.getProfileStatus == FormzStatus.submissionInProgress) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.getProfileStatus ==
                FormzStatus.submissionSuccess) {
              return Padding(
                padding: EdgeInsets.fromLTRB(
                    16, 12, 16, 12 + mediaQuery.padding.bottom),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ProfileImage(
                          url: state.profileEntity.img.middle,
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    InfoItem(
                        title: 'Имя', subTitle: state.profileEntity.fullName),
                    const SizedBox(height: 20),
                    InfoItem(
                        title: 'Номер телефона',
                        subTitle: state.profileEntity.phoneNumber),
                    const SizedBox(height: 20),
                    InfoItem(
                        title: 'Логин', subTitle: state.profileEntity.username),
                    const SizedBox(height: 20),
                    InfoItem(
                        title: 'Электронная почта',
                        subTitle: state.profileEntity.email),
                    const Spacer(),
                    WButton(
                      text: 'Редактировать',
                      onTap: () {
                        Navigator.of(context)
                            .push(fade(page: const ProfileEditScreen()));
                      },
                    )
                  ],
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
        ),
      ),
    );
  }
}
