import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/hospital_single/presentation/hospital_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopHospitalItem extends StatefulWidget {
  final List<String> images;
  final String title;
  final String address;
  final double rating;
  final int id;
  final String slug;

  const TopHospitalItem(
      {required this.title,
      required this.rating,
      required this.address,
      required this.images,
      required this.id,
      required this.slug,
      Key? key})
      : super(key: key);

  @override
  State<TopHospitalItem> createState() => _TopHospitalItemState();
}

class _TopHospitalItemState extends State<TopHospitalItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
            fade(page: HospitalSingleScreen(slug: widget.slug, id: widget.id)));
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 8),
              blurRadius: 24,
              color: darkerGreen.withOpacity(0.09),
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * .8,
        margin: EdgeInsets.only(right: 16),
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
                      child: widget.images.isNotEmpty
                          ? ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.zero,
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.images.length,
                              separatorBuilder: (context, index) =>
                                  const SizedBox(width: 8),
                              itemBuilder: (context, index) => ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: WImage(
                                  imageUrl: widget.images[index],
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
                        Text(
                          widget.title,
                          style: Theme.of(context).textTheme.displayLarge,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          widget.address,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: textSecondary),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (widget.rating != 0) ...{
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
                        widget.rating.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14),
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
