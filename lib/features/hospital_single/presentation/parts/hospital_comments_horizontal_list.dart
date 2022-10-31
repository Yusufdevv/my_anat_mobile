import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_single_entity.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_bottom_sheet.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalCommentsHorizontalList extends StatelessWidget {
  final HospitalSingleEntity hospital;
  final CommentsBloc commentsBloc;
  const HospitalCommentsHorizontalList({
    required this.hospital,
    Key? key,
    required this.commentsBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: commentsBloc,
      child: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, commentState) {
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            color: white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    LocaleKeys.reviews.tr(),
                    style: Theme.of(context).textTheme.headline4!.copyWith(color: textColor),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        hospital.rating.toString(),
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
                              rate: hospital.rating,
                              inactiveStarColor: primary.withOpacity(0.5),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              '${hospital.commentCount} ${LocaleKeys.review.tr()}',
                              style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor, fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      if (commentState.comments.where((element) => element.isOwn).isEmpty) ...{
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
                SizedBox(
                  height: 182,
                  child: ListView.separated(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => SizedBox(
                            width: MediaQuery.of(context).size.shortestSide - 32,
                            child: CommentItem(
                              hasShadow: false,
                              isMainScreen: true,
                              onTapDelete: () {
                                commentsBloc.add(
                                  CommentsEvent.deleteHospitalComment(
                                    id: commentState.comments[index].id,
                                    onSuccess: () {},
                                    onError: () {},
                                  ),
                                );
                              },
                              entity: commentState.comments[index],
                            ),
                          ),
                      separatorBuilder: (context, index) => const SizedBox(width: 8),
                      itemCount: commentState.comments.length),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}