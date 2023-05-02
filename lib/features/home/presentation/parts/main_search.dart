import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainSearchPart extends StatelessWidget {
  final VoidCallback? onTap;
  final Color fillColor;
  final double borderRadius;
  final GlobalKey<FormState>? stateKey;
  const MainSearchPart(
      {this.stateKey,
      this.onTap,
      this.borderRadius = 10,
      this.fillColor = textFieldColor,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 40,
        child: TextFormField(
          key: stateKey,
          enabled: false,
          style: Theme.of(context)
              .textTheme
              .displaySmall!
              .copyWith(color: textColor),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            fillColor: fillColor,
            filled: true,
            suffixIconConstraints: const BoxConstraints(maxWidth: 40),
            prefixIcon: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
              child: Center(
                child: SvgPicture.asset(AppIcons.search),
              ),
            ),
            hintText: LocaleKeys.search.tr(),
            hintStyle: Theme.of(context).textTheme.displaySmall,
            prefixIconConstraints: const BoxConstraints(maxWidth: 40),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: textFieldColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: textFieldColor),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: textFieldColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: const BorderSide(color: primary),
            ),
          ),
        ),
      ),
    );
  }
}
