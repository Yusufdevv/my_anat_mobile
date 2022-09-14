import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/region_bloc/region_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/region_item.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegionBottomSheet extends StatefulWidget {
  final RegionBloc regionBloc;
  final VacancyBloc vacancyBloc;

  const RegionBottomSheet({
    required this.regionBloc,
    required this.vacancyBloc,
    Key? key,
  }) : super(key: key);

  @override
  State<RegionBottomSheet> createState() => _RegionBottomSheetState();
}

class _RegionBottomSheetState extends State<RegionBottomSheet> {
  late PageController pageController;
  int currentPage = 0;
  bool isCheck = false;
  List<String> list = [];
  bool isAllDistrict = false;

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
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: widget.regionBloc),
        BlocProvider.value(value: widget.vacancyBloc),
      ],
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
        stackedWButton: currentPage == 1 || isCheck
            ? WButton(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                text: 'Выбрать',
                onTap: () {
                  widget.vacancyBloc.add(SelectDistrictEvent(
                    onSuccess: () {
                      Navigator.of(context).pop();
                    },
                    districtList: list,
                  ));
                },
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
                  fetchMoreFunction: () {
                    context.read<RegionBloc>().add(GetMoreRegion());
                  },
                  errorWidget: const Text('Fail'),
                  padding: EdgeInsets.fromLTRB(16, 20, 16, 12 + mediaQuery.padding.bottom),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return CheckBoxTitle(
                        onTap: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        isChecked: isCheck,
                        title: LocaleKeys.all_uzb.tr(),
                        padding: EdgeInsets.zero,
                      );
                    }
                    return RegionItem(
                      title: state.regions[index - 1].title,
                      onTap: () {
                        context
                            .read<RegionBloc>()
                            .add(GetDistrictEvent(id: state.regions[index - 1].id));
                        pageController.nextPage(
                            duration: const Duration(milliseconds: 200), curve: Curves.bounceIn);
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(height: 16),
                  itemCount: state.regions.length + 1,
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
                        isChecked: list.contains(widget.regionBloc.state.districts[index+1].title),
                        onTap: () {
                          setState(() {
                            for (var element in widget.regionBloc.state.districts) {
                              if (list.contains(element.title)) {
                                list.remove(element.title);
                              } else {
                                list.add(element.title);
                              }
                            }
                          });
                        },
                        title: LocaleKeys.all.tr(),
                        padding: EdgeInsets.zero,
                      );
                    }
                    print(widget.vacancyBloc.state.districtList);

                    return CheckBoxTitle(
                      padding: EdgeInsets.zero,
                      isChecked: list.contains(widget.regionBloc.state.districts[index - 1].title),
                      title: state.districts[index - 1].title,
                      onTap: () {
                        setState(() {
                          if (list.contains(widget.regionBloc.state.districts[index - 1].title)) {
                            list.remove(widget.regionBloc.state.districts[index - 1].title);
                          } else {
                            list.add(widget.regionBloc.state.districts[index - 1].title);
                          }
                        });
                      },
                    );
                  },
                  fetchMoreFunction: () {
                    context.read<RegionBloc>().add(GetMoreDistrict());
                  },
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

void showRegionBottomSheet(BuildContext context, RegionBloc regionBloc, VacancyBloc vacancyBloc) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    useRootNavigator: true,
    builder: (context) => RegionBottomSheet(vacancyBloc: vacancyBloc, regionBloc: regionBloc),
  );
}
