import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_radio.dart';
import 'package:anatomica/features/journal/domain/entities/period_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectPeriodItem extends StatelessWidget {
  final PeriodEntity selectedPeriod;
  final ValueChanged<PeriodEntity> onChanged;
  final bool isLast;
  final PeriodEntity period;
  const SelectPeriodItem({
    Key? key,
    required this.selectedPeriod,
    required this.onChanged,
    required this.period,
    this.isLast = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            onChanged(period);
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                WRadio<PeriodEntity>(
                  activeColor: primary,
                  inactiveColor: textSecondary,
                  onChanged: onChanged,
                  value: period,
                  groupValue: selectedPeriod,
                ),
                const SizedBox(
                  width: 12,
                ),
                Text(
                  period.title.tr(),
                  style: Theme.of(context).textTheme.headline3!.copyWith(color: textColor),
                )
              ],
            ),
          ),
        ),
        if (!isLast) ...{
          const Divider(
            height: 0,
            thickness: 1,
            indent: 16,
            endIndent: 16,
            color: textFieldColor,
          ),
        }
      ],
    );
  }
}
