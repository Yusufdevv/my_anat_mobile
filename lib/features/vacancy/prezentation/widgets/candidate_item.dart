import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_textwidget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CandidateItem extends StatelessWidget {
  final VoidCallback onTap;
  final EdgeInsets? margin;

  const CandidateItem({this.margin, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: onTap,
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 16),
        padding: const EdgeInsets.fromLTRB(8, 8, 12, 8),
        height: 145,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(width: 1, color: lilyWhite),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 129,
              width: 100,
              decoration: const BoxDecoration(),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl:
                      'https://images.unsplash.com/photo-1524504388940-b1c1722653e1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bW9kZWxzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4, bottom: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Иргашев Дильмурад Саатович',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Стоматолог',
                      style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
                    ),
                    const Spacer(),
                    const VacancyItemTextWidget(title: '10 - 12 лет', icon: AppIcons.briefCase),
                    const SizedBox(height: 4),
                    const VacancyItemTextWidget(
                        title: 'г.Ташкент, Алмазарский р-н', icon: AppIcons.mapPin),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(AppIcons.star),
          ],
        ),
      ),
    );
  }
}
