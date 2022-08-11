import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';

class CategoryContainer extends StatelessWidget {
  final String title;
  final EdgeInsets? margin;

  const CategoryContainer({this.title = '', this.margin, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {},
      child: Container(
        margin: margin ?? const EdgeInsets.only(right: 12, bottom: 20),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        height: 37,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: pattensBlue),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 6),
              color: darkerGreen.withOpacity(0.06),
            )
          ],
        ),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: darkGreen,
                ),
          ),
        ),
      ),
    );
  }
}
