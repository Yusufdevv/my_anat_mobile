import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_service_categories_screen.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/sevice_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AllHospitalServices extends StatefulWidget {
  final ServicesBloc servicesBloc;

  const AllHospitalServices({required this.servicesBloc, Key? key}) : super(key: key);

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
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 21, 16, 0),
                    child: SearchField(
                      controller: _controller,
                      onChanged: (v) {
                        widget.servicesBloc.add(ServicesEvent.searchServicesOrg(query: v));
                      },
                      fillColor: white,
                    ),
                  ),
                  if (state.servicesSpecial.length > 20) ...{
                    Padding(
                      padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                      child: SearchField(
                        fillColor: white,
                        controller: _controller,
                        onChanged: (value) {
                          context.read<ServicesBloc>().add(ServicesEvent.searchServicesOrg(query: value));
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
                        if (state.statusSpecial.isSubmissionInProgress) ...{
                          const Center(
                            child: CupertinoActivityIndicator(),
                          )
                        } else if (state.statusSpecial.isSubmissionSuccess) ...{
                          if (state.servicesSpecial.isEmpty) ...{
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
                                  state.servicesSpecial.length,
                                  (index) {
                                    return ServiceItem(
                                      onTap: () {
                                        Navigator.of(context).push(fade(
                                            page: HospitalServiceCategoriesScreen(
                                          appBarTitle: state.servicesSpecial[index].title,
                                          specializationId: 0,
                                          servicesBloc: widget.servicesBloc,
                                        )));
                                      },
                                      hightlightedText: state.searchQuery,
                                      isLast: index == state.servicesSpecial.length - 1,
                                      title: state.servicesSpecial[index].title,
                                    );
                                  },
                                ),
                              ),
                            )
                          }
                        } else if (state.statusSpecial.isSubmissionFailure) ...{
                          const Center(
                            child: Text('error'),
                          )
                        },
                      ],
                    ),
                  ),
                  if (state.fetchMoreSpecial) ...[
                    WButton(
                      onTap: () {
                        context.read<ServicesBloc>().add(ServicesEvent.getMoreServicesOrg());
                      },
                      isLoading: state.statusSpecial.isSubmissionInProgress,
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
