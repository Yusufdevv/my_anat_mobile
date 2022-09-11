import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteButtonCandidate extends StatefulWidget {
  final VoidCallback onTap;

  const FavouriteButtonCandidate({required this.onTap, Key? key}) : super(key: key);

  @override
  State<FavouriteButtonCandidate> createState() => _FavouriteButtonCandidateState();
}

class _FavouriteButtonCandidateState extends State<FavouriteButtonCandidate> {
  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        setState(() {});
        widget.onTap();
      },
      child: SvgPicture.asset(AppIcons.favouriteActive),
    );
  }
}
