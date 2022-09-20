import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_about_hospital.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_bottom_sheet.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class HospitalCommentList extends StatelessWidget {
  final VoidCallback onTapAll;
  final String description;

  const HospitalCommentList({required this.onTapAll, Key? key, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                color: white,
                child: Html(data: description),
              ),
              if (state.comments.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 0, 12),
                  child: Text(
                    LocaleKeys.reviews.tr(),
                    style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
                  ),
                ),
                Column(
                  children: List.generate(
                    state.comments.take(3).length,
                    (index) => CommentAboutHospital(
                      entity: state.comments[index],
                    ),
                  ),
                ),
                WButton(
                  onTap: onTapAll,
                  margin: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
                  color: commentButton,
                  text: LocaleKeys.all_reviews.tr(),
                  textColor: textSecondary,
                )
              ] else ...{
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    return EmptyWidget(
                      onButtonTap: () {
                        if (state.status == AuthenticationStatus.authenticated) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
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
              },
            ],
          );
        },
      ),
    );
  }
}
