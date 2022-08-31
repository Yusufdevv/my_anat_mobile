import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/domain/entities/article_entity.dart';
import 'package:anatomica/features/map/presentation/screens/hospital_article_single.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class HospitalArticleItem extends StatelessWidget {
  final JournalArticleEntity entity ;
  const HospitalArticleItem({
    required this.entity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        Navigator.of(context).push(fade(page: const HospitalArticleSingle()));
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: textFieldColor,
          ),
          boxShadow: [
            BoxShadow(
              color: darkerGreen.withOpacity(0.09),
              offset: const Offset(0, 8),
              blurRadius: 24,
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://picsum.photos/200/300',
                height: 100,
                width: 82,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    LocaleKeys.all_natural.tr(),
                    style: Theme.of(context).textTheme.headline1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppIcons.mapCalendar),
                      const SizedBox(width: 6),
                      Text(
                        '21 Января, 2022',
                        style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
