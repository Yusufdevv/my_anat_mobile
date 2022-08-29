import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/region_bloc/region_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/region_item.dart';
import 'package:flutter/material.dart';
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
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider.value(
      value: widget.regionBloc,
      child: ScrolledBottomSheet(
        isSubScreen: true,
        title: currentPage == 0 ? 'Регион' : 'г.Ташкент',
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
            BlocBuilder<RegionBloc, RegionState>(
              builder: (context, state) {
                print(state.districtStatus);
                print(state.districts);
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
                        title: 'Весь Узбекистан',
                        padding: EdgeInsets.zero,
                      );
                    }
                    return RegionItem(
                      title: state.regions[index].title,
                      onTap: () {
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
                if (state.districtStatus == PaginatorStatus.PAGINATOR_INITIAL) {
                  context.read<RegionBloc>().add(GetDistrictEvent());
                }
                return Paginator(
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 12 + mediaQuery.padding.bottom),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return CheckBoxTitle(
                        onTap: selectAll,
                        title: 'Все',
                        padding: EdgeInsets.zero,
                      );
                    }
                    return RegionItem(
                      title: state.districts[index].title,
                      onTap: () {},
                    );
                  },
                  fetchMoreFunction: () {},
                  paginatorStatus: state.districtStatus,
                  hasMoreToFetch: state.fetchMoreDistrict,
                  errorWidget: const Center(child: Text('Fail')),
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemCount: state.districts.length,
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
