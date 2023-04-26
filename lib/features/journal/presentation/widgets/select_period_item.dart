import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_radio.dart';
import 'package:anatomica/features/journal/presentation/bloc/payment_bloc/payment_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SelectPeriodItem extends StatelessWidget {
  final PeriodType selectedPeriod;
  final ValueChanged<PeriodType> onChanged;
  final bool isLast;
  final PeriodType period;
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
                WRadio<PeriodType>(
                  activeColor: primary,
                  inactiveColor: textSecondary,
                  onChanged: onChanged,
                  value: period,
                  groupValue: selectedPeriod,
                ),
                const SizedBox(width: 12),
                Text(
                  period.title.tr(),
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
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
