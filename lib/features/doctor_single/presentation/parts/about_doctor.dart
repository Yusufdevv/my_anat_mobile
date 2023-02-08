import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_bottom_sheet.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_item.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutDoctor extends StatelessWidget {
  final TabController controller;
  final String description;
  final bool showBio;
  const AboutDoctor(
      {required this.controller,
      required this.description,
      required this.showBio,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
      builder: (context, state) {
        return ListView(
          padding: const EdgeInsets.symmetric(vertical: 20),
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              color: white,
              child: showBio
                  ? Html(data: description)
                  : Text(LocaleKeys.doctor_do_not_want_show_bio.tr()),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 0, 12),
              child: Text(
                LocaleKeys.reviews.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 20),
              ),
            ),
            if (state.doctorComments.isNotEmpty) ...[
              ...List.generate(
                  state.doctorComments.take(3).length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          children: [
                            CommentItem(
                              entity:
                                  state.doctorComments.take(3).toList()[index],
                              isMainScreen: true,
                              isOrganization: false,
                            ),
                            const SizedBox(
                              height: 16,
                            )
                          ],
                        ),
                      )),
              WButton(
                onTap: () {
                  controller.animateTo(3);
                },
                margin: const EdgeInsets.all(16)
                    .copyWith(bottom: MediaQuery.of(context).padding.bottom),
                color: commentButton,
                text: LocaleKeys.all_reviews.tr(),
                textColor: textSecondary,
              )
            ] else ...[
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return EmptyWidget(
                    onButtonTap: () {
                      if (state.status == AuthenticationStatus.authenticated) {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => CommentBottomSheet(
                            parentContext: context,
                            commentsBloc: context.read<CommentsBloc>(),
                          ),
                        );
                      } else {
                        showRegisterBottomSheet(context);
                      }
                    },
                  );
                },
              )
            ]
          ],
        );
      },
    );
  }
}
