import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_bottom_sheet.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalComments extends StatelessWidget {
  final double overallRating;
  final CommentsBloc commentsBloc;
  final int commentCount;
  final VoidCallback? onTapDelete;

  const HospitalComments(
      {required this.overallRating, required this.commentsBloc, required this.commentCount, this.onTapDelete, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: commentsBloc,
      child: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          return Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: white,
                  border: Border(
                    bottom: BorderSide(color: textFieldColor),
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Text(
                      overallRating.toString(),
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            color: textSecondary,
                            fontSize: 40,
                          ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RatingStars(
                            rate: overallRating,
                            inactiveStarColor: primary.withOpacity(0.5),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '${state.hospitalCommentCount} ${LocaleKeys.review.tr()}',
                            style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                    if (state.comments.where((element) => element.isOwn).isEmpty || !state.isOrganizationCommented) ...{
                      Expanded(
                        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                          builder: (context, state) {
                            return WButton(
                              onTap: () {
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
                              text: LocaleKeys.add_reviews.tr(),
                            );
                          },
                        ),
                      )
                    }
                  ],
                ),
              ),
              Expanded(
                child: Paginator(
                  paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.status),
                  errorWidget: const Text('error'),
                  fetchMoreFunction: () {
                    print('call fetch more');
                    context.read<CommentsBloc>().add(CommentsEvent.getMoreComments());
                  },
                  hasMoreToFetch: state.fetchMore,
                  itemBuilder: (context, index) {
                    return CommentItem(
                      onTapDelete: () {
                        print('del');
                        commentsBloc.add(
                          CommentsEvent.deleteHospitalComment(
                            id: state.comments[index].id,
                            onSuccess: () {
                              print('success deleted');
                            },
                            onError: () {
                              print('error');
                            },
                          ),
                        );
                      },
                      entity: state.comments[index],
                    );
                  },
                  padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
                  separatorBuilder: (context, index) => const SizedBox(height: 12),
                  itemCount: state.comments.length,
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
