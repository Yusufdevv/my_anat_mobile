import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/region_item.dart';
import 'package:flutter/material.dart';

class RegionBottomSheet extends StatelessWidget {
  const RegionBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ScrolledBottomSheet(
      title: 'Регион',
      hasHeader: true,
      child: ListView.separated(
        padding: EdgeInsets.fromLTRB(16, 20, 16, 12 + mediaQuery.padding.bottom),
        shrinkWrap: true,
        itemBuilder: (context, index) => const RegionItem(),
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemCount: 10,
      ),
    );
  }
}

void showRegionBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    builder: (context) => const RegionBottomSheet(),
  );
}
