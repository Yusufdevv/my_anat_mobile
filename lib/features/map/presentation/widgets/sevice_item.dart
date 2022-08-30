import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/hospital_single/data/models/service.dart';
import 'package:anatomica/features/map/presentation/screens/service_single.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  final SingleServiceModel entity;
  final bool isLast;

  const ServiceItem({
    required this.entity,
    this.isLast = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(fade(page:  ServiceSingleScreen(url: 'https://www.youtube.com/',)));
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const SizedBox(
                  height: 6,
                  width: 6,
                  child: DecoratedBox(
                    decoration:
                        BoxDecoration(color: primary, shape: BoxShape.circle),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: HighlightedText(
                    allText:entity.name,
                    highlightedText: '',
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 15),
                    textStyleHighlight: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 15),
                  ),
                )
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
