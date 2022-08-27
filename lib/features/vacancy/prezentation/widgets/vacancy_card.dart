import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:flutter/material.dart';

class VacancyCard extends StatelessWidget {
  final VoidCallback onTap;
  final VacancyListEntity vacancyListEntity;

  const VacancyCard({required this.onTap, required this.vacancyListEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        width: 223,
        height: 131,
        margin: const EdgeInsets.only(left: 12),
        padding: const EdgeInsets.fromLTRB(12, 12, 0, 0),
        decoration: BoxDecoration(
          color: lilyWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: pattensBlue),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              vacancyListEntity.organization.speciazilation[0].title,
              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14),
            ),
            const SizedBox(height: 4),
            Text('${vacancyListEntity.salaryFrom} - ${vacancyListEntity.salaryTo} UZS',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontSize: 13, fontWeight: FontWeight.w400)),
            const SizedBox(height: 1),
            const WDivider(margin: EdgeInsets.symmetric(vertical: 10)),
            const SizedBox(height: 10),
            VacancyItemTextWidget(
                title: '${vacancyListEntity.experienceFrom} - '
                    '${vacancyListEntity.experienceTo} '
                    'лет',
                icon: AppIcons.briefCase),
            const SizedBox(height: 8),
            VacancyItemTextWidget(title: vacancyListEntity.address, icon: AppIcons.mapPin),
          ],
        ),
      ),
    );
  }
}
