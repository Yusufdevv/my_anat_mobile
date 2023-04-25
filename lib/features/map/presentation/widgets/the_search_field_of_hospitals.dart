import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TheSearchFieldOfHospitals extends StatelessWidget {
  final bool isSearching;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onClear;
  final ValueChanged<String> onChanged;
  const TheSearchFieldOfHospitals(
      {Key? key,
      required this.isSearching,
      required this.controller,
      required this.focusNode,
      required this.onClear,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 45),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: textFieldColor),
        color: white,
      ),
      child: Row(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            height: 40,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: divider)),
            width: isSearching || controller.text.isNotEmpty ? 0 : (MediaQuery.of(context).size.width - 44) / 2,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                Navigator.pop(context);
              },
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: isSearching || controller.text.isNotEmpty ? 300 : 0),
                child: isSearching || controller.text.isNotEmpty
                    ? const SizedBox(
                        key: ValueKey<int>(2),
                      )
                    : Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.map,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            LocaleKeys.on_map.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
              ),
            ),
          ),
          SizedBox(
            width: isSearching || controller.text.isNotEmpty ? 0 : 12,
          ),
          Expanded(
            child: SearchField(
              focusNode: focusNode,
              controller: controller,
              onClear: onClear,
              onChanged: onChanged,
            ),
          ),
          isSearching
              ? GestureDetector(
                  onTap: () {
                    focusNode.unfocus();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(left: 12, right: 4),
                    child: Text(
                      LocaleKeys.close.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
