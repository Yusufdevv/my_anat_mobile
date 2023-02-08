import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final EdgeInsets contentPadding;
  final Widget? prefix;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? suffix;
  final double prefixMaxWidth;
  final double suffixMaxWidth;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool hasError;
  final bool isObscure;
  final String prefixText;
  final InputDecoration? inputDecoration;
  final TextInputType? keyboardType;
  final String title;
  final double height;
  final int? maxLines;
  const DefaultTextField({
    required this.controller,
    required this.onChanged,
    this.prefix,
    this.title = '',
    this.contentPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.inputFormatters,
    this.suffix,
    this.prefixMaxWidth = 40,
    this.suffixMaxWidth = 40,
    this.hintStyle,
    this.hintText,
    this.style,
    this.isObscure = false,
    this.hasError = false,
    this.prefixText = '',
    this.inputDecoration,
    this.keyboardType,
    this.height = 40,
    this.maxLines,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title.isNotEmpty) ...[
          Text(
            title,
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: textColor),
          ),
          const SizedBox(height: 8),
        ],
        SizedBox(
          height: height,
          child: TextField(
            controller: controller,
            onChanged: onChanged,
            style: style ??
                Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(color: textColor),
            inputFormatters: inputFormatters,
            obscureText: isObscure,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: inputDecoration ??
                InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: hasError ? red : textFieldColor),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: hasError ? red : primary),
                  ),
                  hintText: hintText,
                  hintStyle:
                      hintStyle ?? Theme.of(context).textTheme.displaySmall,
                  contentPadding: contentPadding,
                  suffixIcon: suffix,
                  suffixIconConstraints:
                      BoxConstraints(maxWidth: suffixMaxWidth),
                  fillColor: textFieldColor,
                  filled: true,
                  prefixIconConstraints:
                      BoxConstraints(maxWidth: prefixMaxWidth),
                  prefixIcon: prefix,
                ),
          ),
        ),
      ],
    );
  }
}
