import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/vacancy/domain/entities/certificate.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LicenceItem extends StatelessWidget {
  final CertificateEntity entity;
  final bool isLast;

  const LicenceItem({required this.entity, this.isLast = false, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 150,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(width: 1, color: lilyWhite),
        boxShadow: [
          BoxShadow(
            color: darkerGreen.withOpacity(0.09),
            blurRadius: 24,
            offset: const Offset(0, 8),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                height: 58,
                width: 58,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    VacancyTitleText(title: entity.title),
                    const SizedBox(height: 4),
                    Text(
                      entity.specialization.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              SvgPicture.asset(AppIcons.calendar),
              const SizedBox(width: 8),
              Text(
                MyFunctions.getPublishedDate(entity.date),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: montana),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              SvgPicture.asset(AppIcons.numberList),
              const SizedBox(width: 8),
              Text(
                entity.certificateNumber,
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: montana),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
