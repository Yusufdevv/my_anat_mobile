import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/region_bloc/region_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/region_item.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionBottomSheet extends StatefulWidget {
  final RegionBloc regionBloc;

  const RegionBottomSheet({required this.regionBloc, Key? key}) : super(key: key);

  @override
  State<RegionBottomSheet> createState() => _RegionBottomSheetState();
}

class _RegionBottomSheetState extends State<RegionBottomSheet> {
  late PageController pageController;
  int currentPage = 0;
  bool isCheck = false;
  List<int> isCheckList = [];

  void selectAll() {
    setState(() {
      isCheck = !isCheck;
    });
  }

  @override
  initState() {
    pageController = PageController();
    // isCheckList=widget.regionBloc.state.
    super.initState();
  }

  @override
  dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider.value(
      value: widget.regionBloc,
      child: ScrolledBottomSheet(
        isSubScreen: currentPage == 1 ? true : false,
        title: currentPage == 0 ? LocaleKeys.region.tr() : 'г.Ташкент',
        hasHeader: true,
        onTapCancel: () {
          if (currentPage == 1) {
            pageController.previousPage(
                duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
          }
        },
        stackedWButton: currentPage == 1
            ? WButton(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                text: 'Выбрать',
                onTap: () {},
              )
            : null,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentPage = index;
            });
          },
          controller: pageController,
          children: [
            BlocBuilder<RegionBloc, RegionState>(
              builder: (context, state) {
                if (state.regionStatus == PaginatorStatus.PAGINATOR_INITIAL) {
                  context.read<RegionBloc>().add(GetRegionEvent());
                }
                return Paginator(
                  hasMoreToFetch: state.fetchMoreRegion,
                  paginatorStatus: state.regionStatus,
                  fetchMoreFunction: () {},
                  errorWidget: const Text('Fail'),
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 12 + mediaQuery.padding.bottom),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return CheckBoxTitle(
                        onTap: selectAll,
                        isChecked: isCheck,
                        title: LocaleKeys.all_uzb.tr(),
                        padding: EdgeInsets.zero,
                      );
                    }
                    return RegionItem(
                      title: state.regions[index].title,
                      onTap: () {
                        context
                            .read<RegionBloc>()
                            .add(GetDistrictEvent(id: state.regions[index].id));
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemCount: state.regions.length,
                );
              },
            ),
            BlocBuilder<RegionBloc, RegionState>(
              builder: (context, state) {
                return Paginator(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 24 + mediaQuery.padding.bottom),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return CheckBoxTitle(
                        onTap: selectAll,
                        isChecked: isCheckList.length == state.districts.length,
                        title: LocaleKeys.all.tr(),
                        padding: EdgeInsets.zero,
                      );
                    }
                    return CheckBoxTitle(
                      padding: EdgeInsets.zero,
                      title: state.districts[index - 1].title,
                      onTap: () {
                        setState(() {
                          isCheckList.add(state.districts[index - 1].id);
                        });
                        context.read<RegionBloc>().add(SelectDistrictEvent(select: isCheckList));
                      },
                    );
                  },
                  fetchMoreFunction: () {},
                  paginatorStatus: state.districtStatus,
                  hasMoreToFetch: state.fetchMoreDistrict,
                  errorWidget: const Center(child: Text('Fail')),
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemCount: state.districts.length + 1,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showRegionBottomSheet(BuildContext context, RegionBloc regionBloc) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    builder: (context) => RegionBottomSheet(regionBloc: regionBloc),
  );
}
