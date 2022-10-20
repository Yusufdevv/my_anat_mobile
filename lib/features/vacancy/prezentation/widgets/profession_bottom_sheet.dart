import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ProfessionBottomSheet extends StatefulWidget {
  final VacancyBloc vacancyBloc;
  final List<int> selectedList;
  const ProfessionBottomSheet({required this.vacancyBloc, required this.selectedList, Key? key}) : super(key: key);

  @override
  State<ProfessionBottomSheet> createState() => _ProfessionBottomSheetState();
}

class _ProfessionBottomSheetState extends State<ProfessionBottomSheet> {
  List<int> selectedList = [];
  @override
  void initState() {
    selectedList.addAll(widget.selectedList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.vacancyBloc,
      child: ScrolledBottomSheet(
        title: LocaleKeys.professions.tr(),
        hasHeader: true,
        stackedWButton: WButton(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          text: LocaleKeys.save.tr(),
          onTap: () {
            widget.vacancyBloc.add(
              SelectCategoryEvent(id: selectedList),
            );
            widget.vacancyBloc.add(
              GetVacancyListEvent(
                onSuccess: () {
                  Navigator.of(context).pop();
                },
              ),
            );
          },
        ),
        children: [
          BlocBuilder<VacancyBloc, VacancyState>(
            builder: (context, state) {
              if (state.categoryStatus.isPure) {
                context.read<VacancyBloc>().add(GetCategoryListEvent());
              } else if (state.categoryStatus.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state.categoryStatus.isSubmissionSuccess) {
                return Column(
                  children: [
                    const SizedBox(height: 16),
                    ...List.generate(
                      state.categoryList.length,
                      (index) => CheckBoxTitle(
                        isChecked: selectedList.contains(state.categoryList[index].id),
                        onTap: () {
                          if (selectedList.contains(state.categoryList[index].id)) {
                            setState(() {
                              selectedList.remove(state.categoryList[index].id);
                            });
                          } else {
                            setState(() {
                              selectedList.add(state.categoryList[index].id);
                            });
                          }
                        },
                        isLast: index == state.categoryList.length - 1,
                        title: state.categoryList[index].title,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                );
              } else if (state.filterStatus.isSubmissionFailure) {
                return const Center(child: Text('Fail'));
              }
              return const Center(child: CupertinoActivityIndicator());
            },
          ),
        ],
      ),
    );
  }
}

void showProfessionBottomSheet(
  BuildContext context,
  VacancyBloc vacancyBloc,
  List<int> selectedList,
) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ProfessionBottomSheet(vacancyBloc: vacancyBloc, selectedList: selectedList),
  );
}
