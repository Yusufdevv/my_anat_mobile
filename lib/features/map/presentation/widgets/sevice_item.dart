import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/screens/service_single.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final bool isLast;
  const ServiceItem({
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WScaleAnimation(
          scaleValue: 0.98,
          onTap: () {
            Navigator.of(context).push(fade(page: const ServiceSingleScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(
                  height: 6,
                  width: 6,
                  child: DecoratedBox(
                    decoration: BoxDecoration(color: primary, shape: BoxShape.circle),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  'Консультации врачей-специалистов',
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 15),
                ),
              ],
            ),
          ),
        ),
        if (!isLast) ...{
          const Divider(
            height: 0,
            thickness: 1,
            color: textFieldColor,
          ),
        }
      ],
    );
  }
}
