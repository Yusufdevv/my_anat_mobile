import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapButton extends StatelessWidget {
  final String title;
  final int id;
  final Widget _leading;
  final EdgeInsets _padding;
  final Function(int) onTap;
  final bool? selected;
  MapButton.chip({
    required this.id,
    required this.title,
    required this.onTap,
    this.selected,
    Key? key,
  })  : _leading = Container(
          width: 12,
          height: 28,
          decoration: BoxDecoration(
            color: selected != null && selected ? primary : Colors.grey[300],
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        _padding = const EdgeInsets.fromLTRB(4, 4, 12, 4),
        super(key: key);

  MapButton.defaultButton(
      {required this.title,
      required this.onTap,
      String icon = AppIcons.listIcon,
      Key? key,
      this.selected,
      required this.id})
      : _leading = SvgPicture.asset(icon),
        _padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        onTap(id);
      },
      child: Container(
        padding: _padding,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 24,
              color: chipShadowColor.withOpacity(0.19),
            ),
          ],
        ),
        child: Row(
          children: [
            _leading,
            const SizedBox(width: 8),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall!
                  .copyWith(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}
