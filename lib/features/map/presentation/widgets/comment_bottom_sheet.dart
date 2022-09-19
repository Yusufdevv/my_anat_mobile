import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/default_text_field.dart';
import 'package:anatomica/features/common/presentation/widgets/rating_container.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/hospital_single/domain/entities/post_comment_entity.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

class CommentBottomSheet extends StatefulWidget {
  final BuildContext parentContext;
  final ValueChanged<PostCommentEntity>? onSubmit;
  final CommentsBloc? commentsBloc;
  const CommentBottomSheet({
    required this.parentContext,
    this.commentsBloc,
    this.onSubmit,
    Key? key,
  }) : super(key: key);

  @override
  State<CommentBottomSheet> createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  double rating = 0;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WKeyboardDismisser(
      child: Container(
        padding: const EdgeInsets.only(left: 16),
        decoration: const BoxDecoration(
          color: white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  LocaleKeys.add_reviews.tr(),
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
                ),
                WScaleAnimation(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: SvgPicture.asset(
                      AppIcons.bottomSheetCancel,
                      height: 28,
                    ),
                  ),
                )
              ],
            ),
            const Divider(
              height: 0,
              thickness: 1,
              color: textFieldColor,
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(bottom: 16, right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: textFieldColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingStars(
                    rate: rating,
                    starSize: 32,
                    starSpacing: 12,
                    onChanged: (value) {
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                  Text(
                    rating.toDouble().toString(),
                    style: Theme.of(context).textTheme.headline1!.copyWith(color: primary, fontSize: 32),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 20),
              child: DefaultTextField(
                controller: _controller,
                maxLines: 40,
                contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 11),
                onChanged: (value) {},
                title: LocaleKeys.opinion.tr(),
                height: 120,
                hintText: LocaleKeys.enter_opinion.tr(),
              ),
            ),
            WButton(
              onTap: () {
                if (widget.commentsBloc != null) {
                  widget.commentsBloc!.add(CommentsEvent.postComment(
                      comment: PostCommentEntity(comment: _controller.text, rating: rating.toInt()),
                      onSuccess: () {
                        Navigator.of(context).pop();
                        showModalBottomSheet(
                          context: widget.parentContext,
                          backgroundColor: Colors.transparent,
                          isScrollControlled: true,
                          builder: (_) => const CommentSuccessBottomSheet(),
                        );
                      }));
                }
              },
              margin: const EdgeInsets.only(right: 16),
              text: LocaleKeys.feedback.tr(),
            ),
            SizedBox(
              height: 16 + MediaQuery.of(context).padding.bottom + MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}

class CommentSuccessBottomSheet extends StatelessWidget {
  const CommentSuccessBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(16, 0, 16, 16 + MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
        color: white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 65),
          Lottie.asset(AppIcons.checkLottie, width: 150, height: 150),
          const SizedBox(height: 24),
          Text(
            LocaleKeys.successfully_sent.tr(),
            style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
          ),
          const SizedBox(height: 8),
          Text(
            LocaleKeys.your_review_successfully.tr(),
            style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          WButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            text: LocaleKeys.clear.tr(),
          )
        ],
      ),
    );
  }
}
