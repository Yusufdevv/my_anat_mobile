import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final VoidCallback? onClear;
  final Color fillColor;
  final FocusNode? focusNode;
  final GlobalKey<FormState>? stateKey;

  const SearchField({
    this.focusNode,
    this.stateKey,
    required this.controller,
    required this.onChanged,
    this.onClear,
    this.fillColor = textFieldColor,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;
  bool showClear = false;

  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: TextFormField(
        key: widget.stateKey,
        focusNode: widget.focusNode,
        controller: _controller,
        onChanged: (text) {
          widget.onChanged(text);
          if (text.isNotEmpty && !showClear) {
            setState(() {
              showClear = true;
            });
          } else if (text.isEmpty && showClear) {
            setState(() {
              showClear = false;
            });
          }
        },
        style:
            Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          fillColor: widget.fillColor,
          filled: true,
          suffixIconConstraints: const BoxConstraints(maxWidth: 40),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
            child: Center(
              child: SvgPicture.asset(AppIcons.search),
            ),
          ),
          hintText: LocaleKeys.search.tr(),
          hintStyle: Theme.of(context).textTheme.headline3,
          prefixIconConstraints: const BoxConstraints(maxWidth: 40),
          suffixIcon: showClear
              ? WScaleAnimation(
                  onTap: () {
                    _controller.clear();
                    if (widget.onClear != null) {
                      widget.onClear!();
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: SvgPicture.asset(AppIcons.clearRounded),
                  ),
                )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: textFieldColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: textFieldColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: primary),
          ),
        ),
      ),
    );
  }
}
