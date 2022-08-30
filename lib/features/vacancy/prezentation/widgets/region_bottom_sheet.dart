import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/region_item.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class RegionBottomSheet extends StatefulWidget {
  const RegionBottomSheet({Key? key}) : super(key: key);

  @override
  State<RegionBottomSheet> createState() => _RegionBottomSheetState();
}

class _RegionBottomSheetState extends State<RegionBottomSheet> {
  late PageController pageController;
  int currentPage = 0;
  bool isCheck = false;
  List<String> regionList = [
    'г.Ташкент',
    'Андижанская область',
    'Бухарская область',
    'Ферганская '
        'область',
    'Хорезмская область',
    'Наманганская область',
    'Навоийская область',
    'Сырдарьинская '
        'область',
    'Ташкентская область',
  ];
  final List<String> districtList = [
    'Мирзо-улугбекский район',
    'Бектемирский район',
    'Мирабадский '
        'район',
    'Сергелийский район',
    'Алмазарский район',
    'Учтепинский район',
    'Шайхантахурский '
        'район',
    'Яшнабадский район',
  ];

  void selectAll() {
    setState(() {
      isCheck = !isCheck;
    });
  }

  @override
  initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return ScrolledBottomSheet(
      isSubScreen: true,
      title: currentPage == 0 ? LocaleKeys.region.tr() : 'г.Ташкент',
      hasHeader: true,
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        controller: pageController,
        children: [
          ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding:
                EdgeInsets.fromLTRB(16, 20, 16, 12 + mediaQuery.padding.bottom),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return CheckBoxTitle(
                  onTap: selectAll,
                  title: LocaleKeys.all_uzb.tr(),
                  padding: EdgeInsets.zero,
                );
              }
              return RegionItem(
                title: regionList[index],
                onTap: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceIn);
                },
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: regionList.length + 1,
          ),
          ListView.separated(
            padding:
                EdgeInsets.fromLTRB(16, 20, 16, 12 + mediaQuery.padding.bottom),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0) {
                return CheckBoxTitle(
                  onTap: selectAll,
                  title: LocaleKeys.all.tr(),
                  padding: EdgeInsets.zero,
                );
              }
              return RegionItem(
                title: districtList[index],
                onTap: () {},
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: 16),
            itemCount: districtList.length + 1,
          ),
        ],
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
