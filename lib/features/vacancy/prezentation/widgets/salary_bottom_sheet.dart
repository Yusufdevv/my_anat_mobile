import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/vacancy/domain/entities/vacancy_params.dart';
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

  const SalaryBottomSheet({required this.vacancyBloc, Key? key}) : super(key: key);

  @override
  State<SalaryBottomSheet> createState() => _SalaryBottomSheetState();
}

class _SalaryBottomSheetState extends State<SalaryBottomSheet> {
  final List<bool> checkList = [false, false, false, false, false];
  bool isChecked = false;

  selectSalary(int index) {
    setState(() {
      checkList[index] = !checkList[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
                salaryKey: widget.vacancyBloc.state.vacancyFilterList[0].choices[0].key,
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
                          selectSalary(index);
                        },
                        title: state.vacancyFilterList[0].choices[index].value,
                        isLast: false,
                        isChecked: checkList[index],
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

void showSalaryBottomSheet(BuildContext context, VacancyBloc vacancyBloc) {
  showModalBottomSheet(
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) => SalaryBottomSheet(vacancyBloc: vacancyBloc),
  );
}
