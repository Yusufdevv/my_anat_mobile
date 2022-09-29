import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyPage extends StatelessWidget {
  final String iconPath;
  final String title;
  final String desc;

  const EmptyPage({required this.title, this.desc = '', required this.iconPath, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: (MediaQuery.of(context).size.height) * 0.22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
              width: 165,
              height: 125,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w700, fontSize: 20),
            ),
            const SizedBox(
              height: 2,
            ),
            if (desc.isNotEmpty) ...{
              Text(
                desc,
                style: Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
              )
            }
          ],
        ),
      );
}
