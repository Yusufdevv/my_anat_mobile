import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/domain/entities/period_entity.dart';
import 'package:anatomica/features/journal/presentation/widgets/select_period_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectPeriodBottomSheet extends StatefulWidget {
  final PeriodEntity initialPeriod;
  const SelectPeriodBottomSheet({
    required this.initialPeriod,
    Key? key,
  }) : super(key: key);

  @override
  State<SelectPeriodBottomSheet> createState() => _SelectPeriodBottomSheetState();
}

class _SelectPeriodBottomSheetState extends State<SelectPeriodBottomSheet> {
  PeriodEntity selectedPeriod = const PeriodEntity(title: LocaleKeys.days_30, period: 1);

  List<PeriodEntity> periods = const [
    PeriodEntity(title: LocaleKeys.days_30, period: 1),
    PeriodEntity(title: LocaleKeys.months_3, period: 3),
    PeriodEntity(title: LocaleKeys.months_6, period: 6),
    PeriodEntity(title: LocaleKeys.year_1, period: 12),
  ];

  @override
  void initState() {
    super.initState();
    selectedPeriod = widget.initialPeriod;
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  LocaleKeys.period.tr(),
                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
                ),
              ),
              WScaleAnimation(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: SvgPicture.asset(AppIcons.bottomSheetCancel),
                ),
              )
            ],
          ),
          const Divider(
            height: 0,
            thickness: 1,
            indent: 16,
            color: textFieldColor,
          ),
          ...List.generate(
            periods.length,
            (index) => SelectPeriodItem(
              selectedPeriod: selectedPeriod,
              period: periods[index],
              isLast: index == periods.length - 1,
              onChanged: (value) {
                setState(() {
                  selectedPeriod = value;
                });
              },
            ),
          ),
          WButton(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            onTap: () {
              Navigator.of(context).pop(selectedPeriod);
            },
            text: LocaleKeys.select.tr(),
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}