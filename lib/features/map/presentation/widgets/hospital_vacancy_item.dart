import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalVacancyItem extends StatelessWidget {
  final VacancyListEntity entity;
  const HospitalVacancyItem({
    Key? key,
    required this.entity
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
      decoration: BoxDecoration(
        color: white,
        border: Border.all(color: textFieldColor),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: darkerGreen.withOpacity(0.09),
            offset: const Offset(0, 8),
            blurRadius: 24,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entity.title,
            style: Theme.of(context).textTheme.headline1,
          ),
          const SizedBox(height: 4),
          Text(
            '${entity.salaryFrom} - ${entity.salaryTo} UZS',
            style: Theme.of(context).textTheme.headline1!.copyWith(color: primary, fontSize: 18),
          ),
          const SizedBox(height: 12),
          const Divider(
            height: 0,
            thickness: 1,
            color: textFieldColor,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.vacancies,
                height: 20,
                color: primary,
              ),
              const SizedBox(width: 8),
              Text(
                '${entity.experienceFrom} - ${entity.experienceTo} лет',
                style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor, fontSize: 13),
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.location,
                height: 20,
                color: primary,
              ),
              const SizedBox(width: 8),
              Text(
               entity.address,
                style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor, fontSize: 13),
              )
            ],
          ),
        ],
      ),
    );
  }
}
