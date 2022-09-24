import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class DeleteCommentDialog extends StatelessWidget {
  final VoidCallback? onTapDelete;

  const DeleteCommentDialog({
    this.onTapDelete,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    LocaleKeys.attention.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .headline3!
                        .copyWith(color: textColor, fontSize: 20),
                  ),
                ),
                WScaleAnimation(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    child: SvgPicture.asset(
                      AppIcons.cancelX,
                      height: 24,
                      color: manatee,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                LocaleKeys.note_attention.tr(),
                style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 12),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 15, 16, 20),
              child: Row(
                children: [
                  Expanded(
                    child: WButton(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      color: unFollowButton.withOpacity(0.1),
                      border: Border.all(color: primary),
                      text: LocaleKeys.cancel.tr(),
                      textColor: primary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: WButton(
                      onTap: () {
                        print('delete dialog');
                        onTapDelete!();
                        Navigator.of(context).pop();
                      },
                      color: deleteButton,
                      text: LocaleKeys.delete.tr(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
