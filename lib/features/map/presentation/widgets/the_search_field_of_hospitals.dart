import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TheSearchFieldOfHospitals extends StatelessWidget {
  final bool isSearching;
  final bool isMap;
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onClear;
  final ValueChanged<String> onChanged;
  final MediaQueryData mediaQuery;
  final VoidCallback onLeftButtonPressed;
  final VoidCallback onSearchFieldTap;
  final VoidCallback onCloseTap;

  const TheSearchFieldOfHospitals({
    Key? key,
    required this.isMap,
    required this.isSearching,
    required this.controller,
    required this.focusNode,
    required this.onClear,
    required this.onChanged,
    required this.mediaQuery,
    required this.onLeftButtonPressed,
    required this.onSearchFieldTap,
    required this.onCloseTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
      builder: (context, state) {
        if (!state.showMainTab) {
          return const SizedBox.shrink();
        }
        return Container(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 45),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: textFieldColor),
            color: white,
            // color: Colors.teal,
          ),
          child: Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 40,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10), border: Border.all(color: divider)),
                width: isSearching || controller.text.isNotEmpty ? 0 : (mediaQuery.size.width - 44) / 2,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onLeftButtonPressed,
                  child: AnimatedSwitcher(
                    duration: Duration(milliseconds: isSearching || controller.text.isNotEmpty ? 300 : 0),
                    child: isSearching || controller.text.isNotEmpty
                        ? const SizedBox(key: ValueKey<int>(2))
                        : Row(
                            children: [
                              SvgPicture.asset(isMap ? AppIcons.listIcon : AppIcons.map, width: 20, height: 20),
                              const SizedBox(width: 8),
                              Text(
                                isMap ? LocaleKeys.list.tr() : LocaleKeys.on_map.tr(),
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
              SizedBox(width: isSearching || controller.text.isNotEmpty ? 0 : 12),
              Expanded(
                child: SearchField(
                  onTap: onSearchFieldTap,
                  focusNode: focusNode,
                  controller: controller,
                  onClear: onClear,
                  onChanged: onChanged,
                ),
              ),
              isSearching
                  ? GestureDetector(
                      onTap: onCloseTap,
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
      },
    );
  }
}
