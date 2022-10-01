import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/bloc/show_pop_up/show_pop_up_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomScreen extends StatelessWidget {
  final Widget child;

  const CustomScreen({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowPopUpBloc, ShowPopUpState>(
      builder: (context, state) => Material(
        child: Stack(
          children: [
            Positioned.fill(child: WKeyboardDismisser(child: child)),
            AnimatedPositioned(
              top: state.showPopUp
                  ? MediaQuery.of(context).padding.top + 12
                  : -(MediaQuery.of(context).padding.top + 12 + 56),
              left: 16,
              right: 16,
              duration: const Duration(milliseconds: 150),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: lightRed,
                  border: Border.all(color: errorBorder),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: errorIconContainer,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: Alignment.center,
                      child: SvgPicture.asset(AppIcons.errorIcon),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        state.message.tr(),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline3!.copyWith(color: errorTextColor),
                      ),
                    ),
                    WScaleAnimation(
                      onTap: () {
                        context.read<ShowPopUpBloc>().add(HidePopUp());
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(AppIcons.errorClose),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
