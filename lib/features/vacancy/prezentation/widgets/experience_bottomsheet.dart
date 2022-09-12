import 'package:anatomica/features/common/presentation/widgets/scrolled_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/checkbox_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ExperienceBottomSheet extends StatefulWidget {
  final VacancyBloc vacancyBloc;

  const ExperienceBottomSheet({
    required this.vacancyBloc,
    Key? key,
  }) : super(key: key);

  @override
  State<ExperienceBottomSheet> createState() => _ExperienceBottomSheetState();
}

class _ExperienceBottomSheetState extends State<ExperienceBottomSheet> {
  final List<bool> checkList = [false, false, false, false];

  void isChecked(int index) {
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
        title: LocaleKeys.experience.tr(),
        hasHeader: true,
        stackedWButton: WButton(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          text: LocaleKeys.save.tr(),
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
        children: [
          BlocBuilder<VacancyBloc, VacancyState>(
            builder: (context, state) {
              if (state.filterStatus.isPure) {
                context.read<VacancyBloc>().add(GetVacancyFilterEvent());
              } else if (state.filterStatus.isSubmissionInProgress) {
                return const Center(child: CupertinoActivityIndicator());
              } else if (state.filterStatus.isSubmissionSuccess) {
                return Column(
                  children: [
                    const SizedBox(height: 16),
                    ...List.generate(
                      state.vacancyFilterList[1].choices.length,
                      (index) => CheckBoxTitle(
                        isChecked: checkList[index],
                        onTap: () {
                          isChecked(index);
                        },
                        title: state.vacancyFilterList[1].choices[index].value,
                        //isLast: index == 4 ? true : false,
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

void showExperienceBottomSheet(BuildContext context, VacancyBloc vacancyBloc) {
  showModalBottomSheet(
    context: context,
    useRootNavigator: true,
    backgroundColor: Colors.transparent,
    builder: (context) => ExperienceBottomSheet(vacancyBloc: vacancyBloc),
  );
}
