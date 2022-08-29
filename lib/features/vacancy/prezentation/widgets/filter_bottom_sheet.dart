import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/region_bloc/region_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_bottomsheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/filter_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/region_bottom_sheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/salary_bottom_sheet.dart';
import 'package:flutter/material.dart';

class FilterBottomSheet extends StatelessWidget {
  final RegionBloc regionBloc;

  const FilterBottomSheet({required this.regionBloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrolledBottomSheet(
      title: 'Фильтр',
      hasHeader: true,
      children: [
        const SizedBox(height: 16),
        FilterItem(
            onTap: () {
              Navigator.of(context).pop();
              showSalaryBottomSheet(context);
            },
            title: 'Зарплата'),
        const SizedBox(height: 12),
        FilterItem(
            onTap: () {
              Navigator.of(context).pop();
              showExperienceBottomSheet(context);
            },
            title: 'Опыт работы'),
        const SizedBox(height: 12),
        FilterItem(
            onTap: () {
              Navigator.of(context).pop();
              showRegionBottomSheet(context, regionBloc);
            },
            title: 'Город/район работы'),
        const SizedBox(height: 20),
        WButton(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          text: 'Сохранить',
          onTap: () {},
        )
      ],
    );
  }
}

void showFilterBottomSheet(BuildContext context, RegionBloc regionBloc) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (context) => FilterBottomSheet(regionBloc: regionBloc),
  );
}
