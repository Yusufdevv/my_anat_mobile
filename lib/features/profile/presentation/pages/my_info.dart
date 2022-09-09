import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:anatomica/features/profile/presentation/pages/profile_edit.dart';
import 'package:anatomica/features/profile/presentation/widgets/info_item.dart';
import 'package:anatomica/features/profile/presentation/widgets/profile_image.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyInfoScreen extends StatelessWidget {
  final ProfileBloc profileBloc;
  const MyInfoScreen({required this.profileBloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider.value(
      value: profileBloc,
      child: Scaffold(
        appBar: WAppBar(title: LocaleKeys.my_details.tr(), hasUnderline: true),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12 + mediaQuery.padding.bottom),
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
                  InfoItem(title: LocaleKeys.name.tr(), subTitle: state.profileEntity.fullName),
                  if (state.profileEntity.phoneNumber.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    InfoItem(title: LocaleKeys.phone_number.tr(), subTitle: state.profileEntity.phoneNumber),
                  ],
                  const SizedBox(height: 20),
                  InfoItem(title: LocaleKeys.login.tr(), subTitle: state.profileEntity.username),
                  if (state.profileEntity.email.isNotEmpty) ...[
                    const SizedBox(height: 20),
                    InfoItem(title: LocaleKeys.mail.tr(), subTitle: state.profileEntity.email),
                  ],
                  const Spacer(),
                  WButton(
                    text: LocaleKeys.edit.tr(),
                    onTap: () {
                      Navigator.of(context).push(
                        fade(
                          page: ProfileEditScreen(
                            userEntity: state.profileEntity,
                            profileBloc: context.read<ProfileBloc>(),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
