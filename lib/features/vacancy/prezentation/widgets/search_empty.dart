import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SearchEmpty extends StatelessWidget {
  const SearchEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(''),
        const SizedBox(height: 16),
        Text(
          'К сожалению по вашему запросу ничего не найдено',
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w400),
        )
      ],
    );
  }
}
