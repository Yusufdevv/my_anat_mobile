import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:animated_size_and_fade/animated_size_and_fade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HelpItem extends StatefulWidget {
  final String title;
  final String content;

  const HelpItem({this.title = '', this.content = '', Key? key})
      : super(key: key);

  @override
  State<HelpItem> createState() => _HelpItemState();
}

class _HelpItemState extends State<HelpItem> {
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 13, 12, 13),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: whiteSmoke2,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                toggle = !toggle;
              });
            },
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 6),
                SvgPicture.asset(
                  toggle ? AppIcons.chevronUp : AppIcons.chevronDown,
                  height: 24,
                  width: 24,
                ),
              ],
            ),
          ),
          AnimatedSizeAndFade.showHide(
            sizeDuration: const Duration(milliseconds: 300),
            show: toggle,
            child: toggle
                ? Column(
                    children: [
                      const SizedBox(height: 8),
                      Text(
                        widget.content,
                        style:
                            Theme.of(context).textTheme.displaySmall!.copyWith(
                                  fontWeight: FontWeight.w400,
                                ),
                      ),
                    ],
                  )
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
