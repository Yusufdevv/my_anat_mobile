import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/sevice_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AllHospitalServices extends StatefulWidget {
  final ServicesBloc servicesBloc;

  const AllHospitalServices({required this.servicesBloc, Key? key})
      : super(key: key);

  @override
  State<AllHospitalServices> createState() => _AllHospitalServicesState();
}

class _AllHospitalServicesState extends State<AllHospitalServices> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return WKeyboardDismisser(
      child: BlocProvider.value(
        value: widget.servicesBloc,
        child: BlocBuilder<ServicesBloc, ServicesState>(
          builder: (context, state) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 16),
              child: Column(
                children: [
                  if (state.services.length > 20) ...{
                    Padding(
                      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                      child: SearchField(
                        fillColor: white,
                        controller: _controller,
                        onChanged: (value) {
                          context
                              .read<ServicesBloc>()
                              .add(ServicesEvent.searchServices(query: value));
                        },
                      ),
                    ),
                  },
                  Container(
                    decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    margin: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (state.status.isSubmissionInProgress) ...{
                          const Center(
                            child: CupertinoActivityIndicator(),
                          )
                        } else if (state.status.isSubmissionSuccess) ...{
                          if (state.services.isEmpty) ...{
                            const SizedBox(height: 16),
                            Center(
                              child: EmptyWidget(
                                hasPadding: true,
                                hasMargin: false,
                                title: state.searchQuery.isNotEmpty
                                    ? LocaleKeys.nothing.tr()
                                    : LocaleKeys.no_services.tr(),
                                content: state.searchQuery.isNotEmpty
                                    ? LocaleKeys.result_not_found.tr()
                                    : LocaleKeys.no_services_in_this_hospital
                                        .tr(),
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
                                  state.services.length,
                                  (index) {
                                    return ServiceItem(
                                      hightlightedText: state.searchQuery,
                                      isLast:
                                          index == state.services.length - 1,
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
                      ],
                    ),
                  ),
                  if (state.fetchMore) ...[
                    WButton(
                      onTap: () {
                        context
                            .read<ServicesBloc>()
                            .add(ServicesEvent.getMoreServices());
                      },
                      isLoading: state.paginationStatus.isSubmissionInProgress,
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
      ),
    );
  }
}
