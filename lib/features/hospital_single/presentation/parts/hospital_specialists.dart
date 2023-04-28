import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_specialist/hospital_specialist_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_items_screen.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/all_hospital_specialists.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/hospital_specialists_item.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/show_all_button.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class HospitalSpecialists extends StatelessWidget {
  final int organizationId;
  const HospitalSpecialists({required this.organizationId, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalSpecialistBloc, HospitalSpecialistState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: state.status.isSubmissionInProgress
              ? const SizedBox(
                  height: 116,
                  child: Center(
                    child: CupertinoActivityIndicator(),
                  ),
                )
              : (state.status.isSubmissionSuccess)
                  ? state.specialists.isNotEmpty
                      ? SizedBox(
                          height: 280,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              if (index == 10) {
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      fade(
                                        page: AllHospitalItemsScreen(
                                          appbarTitle:
                                              LocaleKeys.specialists.tr(),
                                          child: AllHospitalSpecialists(
                                            hospitalSpecialistBloc: context
                                                .read<HospitalSpecialistBloc>(),
                                            organizationId: organizationId,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: primary),
                                    ),
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 16, 0),
                                    margin:
                                        const EdgeInsets.fromLTRB(0, 12, 0, 12),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          LocaleKeys.all_specs.tr(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium!
                                              .copyWith(color: textColor),
                                        ),
                                        SvgPicture.asset(AppIcons.rightArrow),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return SizedBox(
                                width: 164,
                                child: HospitalSpecialistsItem(
                                  id: state.specialists[index].id,
                                  image: state.specialists[index].image.middle,
                                  fullName: state.specialists[index].fullName,
                                  specializations:
                                      state.specialists[index].specializations,
                                  rating: state.specialists[index].rating,
                                ),
                              );
                            },
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            separatorBuilder: (context, index) =>
                                const SizedBox(width: 8),
                            itemCount: state.specialists.length > 10
                                ? state.specialists.take(11).length
                                : state.specialists.length,
                          ),
                        )
                      : Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          color: white,
                          child: EmptyWidget(
                            hasMargin: false,
                            hasPadding: false,
                            title: LocaleKeys.no_specialists.tr(),
                            content:
                                LocaleKeys.no_specialists_in_this_hospital.tr(),
                          ),
                        )
                  : const SizedBox(),
        );
      },
    );
  }
}
