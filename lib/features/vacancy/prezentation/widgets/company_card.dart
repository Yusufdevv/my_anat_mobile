import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {},
      child: Row(
        children: [
          const ImageCard(imageUrl: 'https://picsum.photos/536/354'),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Akfa Medline',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                '13 вакансий',
                style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 13),
              ),
            ],
          ),
          const Spacer(),
          SvgPicture.asset(AppIcons.arrowRight),
          const SizedBox(width: 12)
        ],
      ),
    );
  }
}
