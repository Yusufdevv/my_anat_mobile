import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchField extends StatefulWidget {
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  const SearchField({
    required this.controller,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = widget.controller;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
          fillColor: textFieldColor,
          filled: true,
          suffixIconConstraints: const BoxConstraints(maxWidth: 40),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
            child: Center(
              child: SvgPicture.asset(AppIcons.search),
            ),
          ),
          hintText: 'Поиск',
          hintStyle: Theme.of(context).textTheme.headline3,
          prefixIconConstraints: const BoxConstraints(maxWidth: 40),
          suffixIcon: _controller.text.isNotEmpty
              ? WScaleAnimation(
                  onTap: () {
                    _controller.clear();
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
