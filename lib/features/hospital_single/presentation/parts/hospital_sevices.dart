import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_items_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_services.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/sevice_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalServices extends StatelessWidget {
  final ServicesBloc servicesBloc;

  const HospitalServices({required this.servicesBloc, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: servicesBloc,
      child: BlocBuilder<ServicesBloc, ServicesState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            color: white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  LocaleKeys.service.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: textColor),
                ),
                if (state.status.isSubmissionInProgress) ...{
                  const Center(
                    child: CupertinoActivityIndicator(),
                  )
                } else if (state.status.isSubmissionSuccess) ...{
                  if (state.services.isEmpty) ...{
                    const SizedBox(height: 16),
                    Center(
                      child: EmptyWidget(
                        hasPadding: false,
                        hasMargin: false,
                        title: state.searchQuery.isNotEmpty
                            ? LocaleKeys.nothing.tr()
                            : LocaleKeys.no_services.tr(),
                        content: state.searchQuery.isNotEmpty
                            ? LocaleKeys.result_not_found.tr()
                            : LocaleKeys.no_services_in_this_hospital.tr(),
                      ),
                    )
                  } else ...{
                    Container(
                      decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: List.generate(
                          state.services.length > 5
                              ? state.services.take(6).length
                              : state.services.length,
                          (index) {
                            if (index == 5) {
                              return WButton(
                                text: LocaleKeys.show_all.tr(),
                                textColor: textSecondary,
                                color: commentButton,
                                margin: const EdgeInsets.only(top: 16),
                                onTap: () => Navigator.of(context).push(
                                  fade(
                                    page: AllHospitalItemsScreen(
                                      appbarTitle: 'Услуги',
                                      child: AllHospitalServices(
                                        servicesBloc: servicesBloc,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }
                            return ServiceItem(
                              hightlightedText: state.searchQuery,
                              isLast: index ==
                                  (state.services.length > 5
                                          ? state.services.take(5).length
                                          : state.services.length) -
                                      1,
                              entity: state.services[index],
                            );
                          },
                        ),
                      ),
                    )
                  }
                } else if (state.status.isSubmissionFailure) ...{
                  const Center(
                    child: Text('error'),
                  )
                },
                if (state.fetchMore && state.services.length > 5) ...[
                  const SizedBox(height: 16),
                  WButton(
                    onTap: () {
                      context
                          .read<ServicesBloc>()
                          .add(ServicesEvent.getMoreServices());
                    },
                    color: commentButton,
                    text: LocaleKeys.show_all.tr(),
                    textColor: textSecondary,
                  )
                ]
              ],
            ),
          );
        },
      ),
    );
  }
}
