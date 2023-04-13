import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/service_single.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/sevice_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalServiceCategoriesScreen extends StatefulWidget {
  const HospitalServiceCategoriesScreen({
    required this.appBarTitle,
    required this.specializationId,
    required this.servicesBloc,
    Key? key,
  }) : super(key: key);
  final String appBarTitle;
  final int specializationId;
  final ServicesBloc servicesBloc;

  @override
  State<HospitalServiceCategoriesScreen> createState() => _HospitalServiceCategoriesScreenState();
}

class _HospitalServiceCategoriesScreenState extends State<HospitalServiceCategoriesScreen> {
  late final TextEditingController _controller;
  final ValueNotifier showClearBtn = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    widget.servicesBloc.add(ServicesEvent.getServicesOrg(specializationId: widget.specializationId));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  int lenght = 10;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.servicesBloc,
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WScaleAnimation(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SvgPicture.asset(AppIcons.chevronRight, color: textSecondary),
                  ),
                ),
                Text(
                  widget.appBarTitle,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(width: 56),
              ],
            ),
            titleSpacing: 0,
            leadingWidth: 0,
            elevation: 0,
            shadowColor: textFieldColor,
            automaticallyImplyLeading: false,
          ),
          backgroundColor: lilyWhite,
          body: BlocBuilder<ServicesBloc, ServicesState>(
            builder: (context, state) {
              return state.servicesOrg.isNotEmpty ? SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    ValueListenableBuilder(
                        valueListenable: showClearBtn,
                        builder: (ctx, _, __) {
                          return SizedBox(
                            height: 40,
                            child: TextFormField(
                              controller: _controller,
                              onChanged: (text) {
                                if (!showClearBtn.value || text.isNotEmpty) {
                                  showClearBtn.value = true;
                                } else if (showClearBtn.value || text.isEmpty) {
                                  showClearBtn.value = false;
                                }
                              },
                              style: Theme.of(context).textTheme.displaySmall!.copyWith(color: textColor),
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                                fillColor: white,
                                filled: true,
                                suffixIconConstraints: const BoxConstraints(maxWidth: 40),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 10, 6, 10),
                                  child: Center(
                                    child: SvgPicture.asset(AppIcons.search),
                                  ),
                                ),
                                hintText: LocaleKeys.search.tr(),
                                hintStyle: Theme.of(context).textTheme.displaySmall,
                                prefixIconConstraints: const BoxConstraints(maxWidth: 40),
                                suffixIcon: showClearBtn.value
                                    ? WScaleAnimation(
                                        onTap: () {
                                          _controller.clear();
                                          showClearBtn.value = false;
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: SvgPicture.asset(AppIcons.clearRounded),
                                        ),
                                      )
                                    : null,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: textFieldColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: textFieldColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: const BorderSide(color: primary),
                                ),
                              ),
                            ),
                          );
                        }),
                    const SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(12)),
                      child: Column(
                        children: List.generate(
                          state.servicesOrg.length,
                          (index) => ServiceItem(
                            onTap: () {
                              widget.servicesBloc.add(ServicesEvent.getSingleService(serviceId: state.servicesOrg[index].id));
                              Navigator.of(context).push(
                                fade(
                                    page: ServiceSingleScreen(
                                        serviceUrl: state.servicesOrg[index].url, servicesBloc: widget.servicesBloc)),
                              );
                            },
                            hightlightedText: _controller.text,
                            isLast: index == state.servicesOrg.length - 1,
                            title: state.servicesOrg[index].name,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : Center(
                child: EmptyWidget(
                  hasPadding: false,
                  hasMargin: false,
                  title: state.searchQuery.isNotEmpty ? LocaleKeys.nothing.tr() : LocaleKeys.no_services.tr(),
                  content: state.searchQuery.isNotEmpty
                      ? LocaleKeys.result_not_found.tr()
                      : LocaleKeys.no_services_in_this_hospital.tr(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
