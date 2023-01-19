import 'dart:math';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/hospital_single/presentation/hospital_single_screen.dart';
import 'package:anatomica/features/map/data/repositories/map_repository_impl.dart';
import 'package:anatomica/features/map/domain/entities/hospital_entity.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_map_hospitals.dart';
import 'package:anatomica/features/map/domain/usecases/get_types_usecase.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class HospitalItem extends StatefulWidget {
  final HospitalEntity entity;
  final Point myPoint;

  const HospitalItem({required this.entity, required this.myPoint, Key? key})
      : super(key: key);

  @override
  State<HospitalItem> createState() => _HospitalItemState();
}

class _HospitalItemState extends State<HospitalItem> {
  double distance = -1;

  @override
  void initState() {
    distance = sqrt(pow((widget.myPoint.latitude - widget.entity.latitude), 2) +
        pow((widget.myPoint.longitude - widget.entity.longitude), 2));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(fade(
            page: HospitalSingleScreen(
                slug: widget.entity.slug, id: widget.entity.id)));
      },
      child: DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 24,
              color: darkerGreen.withOpacity(0.09),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: white,
                border: Border.all(color: textFieldColor),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: widget.entity.images.isNotEmpty
                          ? ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.entity.images.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: WImage(
                                  imageUrl: widget.entity.images[index].middle,
                                  fit: BoxFit.cover,
                                  width:
                                      MediaQuery.of(context).size.shortestSide /
                                          2,
                                  onErrorWidget: SvgPicture.asset(
                                    AppIcons.bigImageError,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: errorImageBackground),
                              child: SvgPicture.asset(
                                AppIcons.logo,
                                height: 100,
                                color: textFieldColor,
                              ),
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 12, 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            DecoratedBox(
                              decoration: BoxDecoration(
                                border: Border.all(color: divider),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: WImage(
                                height: 32,
                                width: 32,
                                imageUrl: widget.entity.logo.middle,
                                borderRadius: BorderRadius.circular(6),
                                onErrorWidget: SvgPicture.asset(
                                    AppIcons.smallImageError,
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                widget.entity.title,
                                style: Theme.of(context).textTheme.headline1,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 9,
                              child: Text(
                                widget.entity.address,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(color: textSecondary),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Flexible(
                              flex: 2,
                              child: Row(
                                children: [
                                  Visibility(
                                    visible: distance >= 0 &&
                                        widget.entity.longitude > 0 &&
                                        widget.entity.latitude > 0 &&
                                        widget.myPoint.latitude > 0 &&
                                        widget.myPoint.longitude > 0,
                                    child: Container(
                                      height: 4,
                                      width: 4,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 4, vertical: 6.5),
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          color: textSecondary,
                                          shape: BoxShape.circle),
                                    ),
                                  ),
                                  Visibility(
                                    visible: distance >= 0 &&
                                        widget.entity.longitude > 0 &&
                                        widget.entity.latitude > 0 &&
                                        widget.myPoint.latitude > 0 &&
                                        widget.myPoint.longitude > 0,
                                    child: Text(
                                      distance < 1 && distance > 0
                                          ? '${(distance * 1000).toStringAsFixed(1)} m'
                                          : '${distance.toStringAsFixed(1)} km',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: primary),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.entity.rating != 0) ...{
              Positioned(
                top: 16,
                right: -13,
                child: Container(
                  height: 30,
                  padding: const EdgeInsets.fromLTRB(8, 0, 12, 0),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: textFieldColor),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppIcons.star),
                      const SizedBox(width: 4),
                      Text(
                        widget.entity.rating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(color: darkGreen, fontSize: 14),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 1,
                        height: 30,
                        color: textFieldColor,
                      )
                    ],
                  ),
                ),
              )
            }
          ],
        ),
      ),
    );
  }
}
