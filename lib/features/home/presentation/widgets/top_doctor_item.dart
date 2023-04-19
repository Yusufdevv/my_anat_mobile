import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/doctor_single/presentation/doctor_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopDoctorItem extends StatelessWidget {
  final int id;
  final String name;
  final String jobs;
  final double distance;
  final double rating;
  final String image;

  const TopDoctorItem(
      {required this.id,
      required this.rating,
      required this.distance,
      required this.jobs,
      required this.name,
      required this.image,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          fade(
            page: DoctorSingleScreen(id: id),
          ),
        );
      },
      child: Container(
        width: MediaQuery.of(context).size.width * .75,
        height: 116,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: darkerGreen.withOpacity(0.09),
              offset: const Offset(0, 8),
              blurRadius: 24,
            )
          ],
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: textFieldColor,
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: WImage(
                      imageUrl: image,
                      onErrorWidget: SvgPicture.asset(AppIcons.smallImageError),
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
                          name,
                          style: Theme.of(context).textTheme.displayLarge,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),

                        // ?
                        Text(
                          jobs,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontSize: 14),
                          maxLines: 2,
                        ),
                        // : Wrap(
                        //     children: [
                        //       for (int i = 0;
                        //           i < entity.specializations.length;
                        //           i++)
                        //         Text(
                        //           '${entity.specializations[i].title} ',
                        //           style: Theme.of(context)
                        //               .textTheme
                        //               .headlineMedium!
                        //               .copyWith(fontSize: 14),
                        //         ),
                        //     ],
                        //   ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 4, right: 4),
                              child: SvgPicture.asset(AppIcons.location),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4, right: 8),
                              child: Text(
                                // TODO add distance to doctors
                                '${distance.toStringAsFixed(2)} km',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (rating > 0) ...{
              Positioned(
                left: -9,
                bottom: 18,
                child: Container(
                  height: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(13),
                    border: Border.all(color: textFieldColor),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 1,
                        height: 30,
                        color: textFieldColor,
                      ),
                      const SizedBox(width: 8),
                      SvgPicture.asset(AppIcons.star),
                      const SizedBox(width: 4),
                      Text(
                        (rating > 5 ? 5.0 : rating).toString(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 14),
                      ),
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
