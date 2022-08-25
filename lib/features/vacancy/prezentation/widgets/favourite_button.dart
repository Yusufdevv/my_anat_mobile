import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouriteButton extends StatefulWidget {
  final VoidCallback onTap;
  bool isFavourite;

  FavouriteButton({required this.onTap, this.isFavourite = false, Key? key}) : super(key: key);

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        setState(() {
          widget.isFavourite = !widget.isFavourite;
        });
        widget.onTap();
      },
      child: SvgPicture.asset(widget.isFavourite ? AppIcons.favouriteActive : AppIcons.favourite),
    );
  }
}
