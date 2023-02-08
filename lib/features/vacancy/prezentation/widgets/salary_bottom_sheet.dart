import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class SalaryBottomSheet extends StatefulWidget {
  final VacancyBloc vacancyBloc;
  final List<String> list;

  const SalaryBottomSheet({required this.vacancyBloc, required this.list, Key? key})
      : super(key: key);

  @override
  State<SalaryBottomSheet> createState() => _SalaryBottomSheetState();
}

class _SalaryBottomSheetState extends State<SalaryBottomSheet> {
  @override
  initState() {
    list.addAll(widget.list);
    super.initState();
  }

  List<String> list = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.vacancyBloc,
      child: ScrolledBottomSheet(
        title: LocaleKeys.salary.tr(),
        hasHeader: true,
        stackedWButton: WButton(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          text: LocaleKeys.save.tr(),
          onTap: () async {
            widget.vacancyBloc.add(SelectSalaryFilterEvent(
                salaryKey: list,
                onSuccess: () {
                  Navigator.of(context).pop();
                }));
          },
        ),
        escapeBottomNavbar: true,
        children: [
          BlocBuilder<VacancyBloc, VacancyState>(
            builder: (context, state) {
              if (state.filterStatus.isPure) {
                context.read<VacancyBloc>().add(GetVacancyFilterEvent());
              } else if (state.filterStatus.isSubmissionInProgress) {
                return const Center(child: CircularProgressIndicator());
              } else if (state.filterStatus.isSubmissionSuccess) {
                return Column(
                  children: [
                    const WDivider(),
                    const SizedBox(height: 16),
                    ...List.generate(
                      state.vacancyFilterList[0].choices.length,
                      (index) => CheckBoxTitle(
                        onTap: () {
                          setState(() {
                            if (list.contains(state.vacancyFilterList[0].choices[index].key)) {
                              list.remove(state.vacancyFilterList[0].choices[index].key);
                            } else {
                              list.add(state.vacancyFilterList[0].choices[index].key);
                            }
                          });
                        },
                        title: state.vacancyFilterList[0].choices[index].value,
                        isLast: index + 1 == state.vacancyFilterList[0].choices.length,
                        isChecked: list.contains(state.vacancyFilterList[0].choices[index].key),
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

void showSalaryBottomSheet(
    {required BuildContext context, required VacancyBloc vacancyBloc, required List<String> list}) {
  showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height /2),
    isScrollControlled: true,
    context: context,
    builder: (context) => SalaryBottomSheet(list: list, vacancyBloc: vacancyBloc),
  );
}
