import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LicenceItem extends StatelessWidget {
  const LicenceItem({Key? key}) : super(key: key);

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
              const ImageCard(
                imageUrl:
                    'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bW9kZWxzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                height: 58,
                width: 58,
                hasShadow: true,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const VacancyTitleText(title: 'РГМУ'),
                    const SizedBox(height: 4),
                    Text(
                      'Медико-профилактическое дело ЕГЭ: русский, химия, биология ',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.w400),
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
                'Бакалавриат, медик',
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
                'Бакалавриат, медик',
                style: Theme.of(context).textTheme.bodyText1!.copyWith(color: montana),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
