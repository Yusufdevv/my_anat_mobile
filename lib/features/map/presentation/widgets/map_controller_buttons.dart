import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class MapControllerButtons extends StatelessWidget {
  final VoidCallback onPlusTap;
  final VoidCallback onMinusTap;
  final VoidCallback onCurrentLocationTap;

  const MapControllerButtons({
    required this.onCurrentLocationTap,
    required this.onMinusTap,
    required this.onPlusTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 8),
                blurRadius: 24,
                color: chipShadowColor.withOpacity(0.19),
              ),
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              WScaleAnimation(
                onTap: onPlusTap,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppIcons.plusIcon),
                ),
              ),
              Container(
                height: 1,
                width: 28,
                color: textColor.withOpacity(0.1),
              ),
              WScaleAnimation(
                onTap: onMinusTap,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SvgPicture.asset(AppIcons.minusIcon),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 12),
        CurrentLocationButton(onCurrentLocationTap: onCurrentLocationTap)
      ],
    );
  }
}

class CurrentLocationButton extends StatelessWidget {
  final VoidCallback onCurrentLocationTap;
  const CurrentLocationButton({
    required this.onCurrentLocationTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
      builder: (context, state) {
        return WScaleAnimation(
          isDisabled: state.getCurrentLocationStatus.isSubmissionInProgress,
          onTap: onCurrentLocationTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: state.getCurrentLocationStatus.isSubmissionInProgress ? white.withOpacity(0.7) : white,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 8),
                  blurRadius: 24,
                  color: chipShadowColor.withOpacity(0.19),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 150),
              child: state.getCurrentLocationStatus.isSubmissionInProgress
                  ? const AnimatedLocationIcon()
                  : SvgPicture.asset(AppIcons.currentLocation),
            ),
          ),
        );
      },
    );
  }
}

class AnimatedLocationIcon extends StatefulWidget {
  const AnimatedLocationIcon({Key? key}) : super(key: key);

  @override
  State<AnimatedLocationIcon> createState() => _AnimatedLocationIconState();
}

class _AnimatedLocationIconState extends State<AnimatedLocationIcon> with TickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;
  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 500))
      ..repeat(reverse: true);
    _iconAnimation = Tween<double>(begin: 1, end: 2.3).animate(_iconAnimationController);
  }

  @override
  void dispose() {
    _iconAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        ScaleTransition(
          scale: _iconAnimation,
          child: Container(
            height: 6,
            width: 6,
            decoration: const BoxDecoration(color: primary, shape: BoxShape.circle),
          ),
        ),
        SvgPicture.asset(AppIcons.locationIconOutlined),
      ],
    );
  }
}
