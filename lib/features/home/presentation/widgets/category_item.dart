import 'package:anatomica/assets/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryItem extends StatelessWidget {
  final String logo;
  final String title;
  final VoidCallback onTap;

  const CategoryItem(
      {required this.title, required this.logo, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          border: Border.all(color: textFieldColor, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        height: 77,
        width: MediaQuery.of(context).size.width / 2.25,
        margin: const EdgeInsets.only(right: 8, bottom: 8),
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            logo.contains('http')
                ? SvgPicture.network(
                    logo,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  )
                : SvgPicture.asset(
                    logo,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
            const SizedBox(height: 6),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
