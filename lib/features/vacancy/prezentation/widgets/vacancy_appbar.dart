import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/vacancy_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancyAppBar extends StatelessWidget {
  const VacancyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Container(
      decoration: BoxDecoration(
        color: white,
        boxShadow: [
          BoxShadow(
            color: woodSmoke.withOpacity(0.12),
            blurRadius: 24,
            offset: const Offset(0, 8),
          )
        ],
      ),
      padding: EdgeInsets.fromLTRB(16, 8 + mediaQuery.padding.top, 16, 16),
      child: Row(
        children: [
          SvgPicture.asset(AppIcons.logo, color: black),
          const SizedBox(width: 12),
          Text(
            'Вакансии',
            style: Theme.of(context).textTheme.headline1!.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
          ),
          const Spacer(),
          WScaleAnimation(
            onTap: () {
              Navigator.of(context).push(fade(page: const VacancySearchScreen()));
            },
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: lilyWhite,
              ),
              child: Center(
                child: SvgPicture.asset(AppIcons.vacancySearch),
              ),
            ),
          )
        ],
      ),
    );
  }
}
