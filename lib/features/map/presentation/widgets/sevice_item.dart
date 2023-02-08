import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
import 'package:anatomica/features/hospital_single/domain/entities/hospital_service_entity.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/service_single.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceItem extends StatelessWidget {
  final HospitalServiceEntity entity;
  final bool isLast;
  final String hightlightedText;

  const ServiceItem({
    required this.entity,
    this.isLast = false,
    required this.hightlightedText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context
                .read<ServicesBloc>()
                .add(ServicesEvent.getSingleService(serviceId: entity.id));
            Navigator.of(context).push(
              fade(
                page: ServiceSingleScreen(
                  serviceUrl: entity.url,
                  servicesBloc: context.read<ServicesBloc>(),
                ),
              ),
            );
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
                    allText: entity.name,
                    highlightedText: hightlightedText,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 15),
                    textStyleHighlight: Theme.of(context)
                        .textTheme
                        .displayLarge!
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
