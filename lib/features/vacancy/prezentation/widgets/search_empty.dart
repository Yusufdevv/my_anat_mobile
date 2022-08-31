import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
          LocaleKeys.return_results.tr(),
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.red),
        )
      ],
    );
  }
}
