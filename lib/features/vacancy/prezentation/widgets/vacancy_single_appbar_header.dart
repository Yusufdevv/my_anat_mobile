import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/sliver_tab_bardelegate.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_list.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancySingleAppBarHeader extends StatelessWidget {
  final VacancyListEntity vacancyEntity;

  const VacancySingleAppBarHeader({required this.vacancyEntity, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverTabBarDelegate(
        hasRadius: true,
        height: 89,
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
          decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              )),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      vacancyEntity.title,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      vacancyEntity.organization.title,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: CachedNetworkImage(
                    imageUrl: vacancyEntity.organization.logo.middle,
                    fit: BoxFit.cover,
                    errorWidget: (_, __, ___) => SvgPicture.asset(
                      AppIcons.smallImageError,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        color: primary,
      ),
    );
  }
}
