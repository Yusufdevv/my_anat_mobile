import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:anatomica/features/map/presentation/screens/doctor_single.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DoctorItem extends StatelessWidget {
  final DoctorsEntity entity;
  const DoctorItem({
    required this.entity,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WScaleAnimation(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
          fade(
            page: const DoctorSingleScreen(),
          ),
        );
      },
      child: DecoratedBox(
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
                    child: Image.network(
                      entity.image.middle,errorBuilder: (context,reason,good)=>Container(height: 100,width: 82,),
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
                          entity.name,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          entity.specialization,
                          style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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
                      '5.0',
                      style: Theme.of(context).textTheme.headline1!.copyWith(color: darkGreen, fontSize: 14),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
