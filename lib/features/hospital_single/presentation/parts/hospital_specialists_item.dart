import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/doctor_single/presentation/doctor_single_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalSpecialistsItem extends StatelessWidget {
  final int id;
  final String image;
  final String fullName;
  final List<TitlerModel> specializations;
  final double rating;

  const HospitalSpecialistsItem(
      {required this.id,
      required this.image,
      required this.fullName,
      required this.specializations,
      required this.rating,
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
        margin: const EdgeInsets.symmetric(vertical: 12),
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
              decoration: BoxDecoration(
                color: white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: textFieldColor,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: WImage(
                      imageUrl: image,
                      onErrorWidget: SvgPicture.asset(AppIcons.smallImageError),
                      height: 155,
                      width: 164,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Text(
                        fullName,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(color: textColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                      child: Text(
                        specializations.map((e) => '${e.title} ').join(),
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 14),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            if (rating > 0) ...{
              Positioned(
                left: -9,
                top: 16,
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
                            .copyWith(color: darkGreen, fontSize: 14),
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
