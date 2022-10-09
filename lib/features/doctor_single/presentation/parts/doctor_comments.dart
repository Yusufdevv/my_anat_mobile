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
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorComments extends StatelessWidget {
  final double rating;
  final int? doctor;

  const DoctorComments({this.doctor, required this.rating, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsBloc, CommentsState>(
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
                    (rating > 5
                            ? 5.0
                            : rating < 0
                                ? 0.0
                                : rating)
                        .toString(),
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
                          rate: rating.round().toDouble(),
                          inactiveStarColor: primary.withOpacity(0.5),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          '${state.doctorComments.length} ${LocaleKeys.review.tr()}',
                          style: Theme.of(context)
                              .textTheme
                              .headline3!
                              .copyWith(color: textColor, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                      builder: (context, authState) {
                        return WButton(
                          onTap: () {
                            if (authState.status ==
                                AuthenticationStatus.authenticated) {
                              showModalBottomSheet(
                                backgroundColor: Colors.transparent,
                                context: context,
                                isScrollControlled: true,
                                builder: (_) => CommentBottomSheet(
                                  parentContext: context,
                                  isDoctor: true,
                                  commentsBloc: context.read<CommentsBloc>(),
                                  doctor: doctor,
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
                ],
              ),
            ),
            Expanded(
              child: Paginator(
                padding: const EdgeInsets.all(16).copyWith(
                    bottom: MediaQuery.of(context).padding.bottom + 16),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemBuilder: (context, index) => CommentItem(
                  onTapDelete: () {
                    print('del');
                    context
                        .read<CommentsBloc>()
                        .add(CommentsEvent.deleteDoctorComment(
                            id: state.doctorComments[index].id,
                            onError: () {
                              print('ui error');
                            },
                            onSuccess: () {
                              print('success deleted');
                            }));
                  },
                  entity: state.doctorComments[index],
                ),
                itemCount: state.doctorComments.length,
                paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(
                    state.doctorCommentStatus),
                fetchMoreFunction: () {
                  context
                      .read<CommentsBloc>()
                      .add(CommentsEvent.getMoreDoctorComments());
                },
                emptyWidget: SingleChildScrollView(
                    child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, authState) {
                    return EmptyWidget(
                      onButtonTap: () {
                        if (authState.status ==
                            AuthenticationStatus.authenticated) {
                          showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (_) => CommentBottomSheet(
                              parentContext: context,
                              isDoctor: true,
                              commentsBloc: context.read<CommentsBloc>(),
                              doctor: doctor,
                            ),
                          );
                        } else {
                          showRegisterBottomSheet(context);
                        }
                      },
                    );
                  },
                )),
                hasMoreToFetch: state.doctorCommentFetchMore,
                errorWidget: const Text('error'),
              ),
            )
          ],
        );
      },
    );
  }
}
