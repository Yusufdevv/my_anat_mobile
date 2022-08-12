import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/masked_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool hasError;
  final String hintText;
  final String title;
  final String errorText;

  const PhoneTextField(
      {required this.controller,
      this.hasError = false,
      this.title = '',
      this.hintText = '__ ___ __ __',
      this.errorText = '',
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
              ),
              if (hasError) ...[
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    errorText,
                    textAlign: TextAlign.right,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline3!.copyWith(color: red),
                  ),
                )
              ]
            ],
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          height: 40,
          child: WMaskedTextField(
            controller: controller,
            style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: hasError ? red : textFieldColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: hasError ? red : primary),
              ),
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.headline3,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              fillColor: textFieldColor,
              filled: true,
              prefixIconConstraints: const BoxConstraints(maxWidth: 77),
              prefixIcon: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: SvgPicture.asset(
                      AppIcons.deviceMobile,
                      width: 20,
                      color: textSecondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 1.5),
                    child: Text(
                      '+998',
                      style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                    ),
                  ),
                  const SizedBox(width: 4)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
