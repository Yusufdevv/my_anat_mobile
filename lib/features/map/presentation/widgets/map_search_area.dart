import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/presentation/bloc/login_sign_up_bloc/login_sign_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MapSearchArea extends StatelessWidget {
  final MediaQueryData mediaQuery;
  final VoidCallback onButtonPressed;
  final VoidCallback onRightbuttonPressed;
  final String searchText;

  const MapSearchArea({
    required this.onButtonPressed,
    required this.searchText,
    required this.mediaQuery,
    required this.onRightbuttonPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginSignUpBloc, LoginSignUpState>(
      builder: (context, state) {
        if (!state.showMainTab) {
          return Positioned(top: 100, child: Container(height: 20, width: 20));
        }
        return Positioned(
          bottom: mediaQuery.viewInsets.bottom + 83,
          right: 0,
          left: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 16, 16, mediaQuery.viewInsets.bottom + 43),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: textFieldColor),
              // color: white,
              color: Colors.orange,
            ),
            child: GestureDetector(
              child: Row(
                children: [
                  Expanded(
                    child: WButton(
                      onTap: onButtonPressed,
                      border: Border.all(color: divider),
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                      borderRadius: 10,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppIcons.listIcon,
                            width: 20,
                            height: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            LocaleKeys.list.tr(),
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: GestureDetector(
                      onTap: onRightbuttonPressed,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: lilyWhite),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppIcons.search,
                                  width: 20,
                                  height: 20,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    LocaleKeys.search.tr(),
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                                        color: searchText.isNotEmpty ? textColor : textSecondary,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ),
                                if (searchText.isNotEmpty) ...{
                                  GestureDetector(
                                    onTap: () {},
                                    child: SvgPicture.asset(
                                      AppIcons.clearRounded,
                                      width: 24,
                                      height: 24,
                                    ),
                                  )
                                }
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
