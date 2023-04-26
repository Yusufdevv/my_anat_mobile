import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/common/presentation/widgets/w_cupertino_switch.dart';
import 'package:anatomica/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutoPaymentPage extends StatefulWidget {
  const AutoPaymentPage({required this.profileBloc, super.key});

  final ProfileBloc profileBloc;

  @override
  State<AutoPaymentPage> createState() => _AutoPaymentPageState();
}

class _AutoPaymentPageState extends State<AutoPaymentPage> {
  bool enableJournalAutoPay = false;
  bool enableDoctorAutoPay = false;
  bool enableOrganizationAutoPay = false;

  @override
  void initState() {
    super.initState();
    enableDoctorAutoPay = widget.profileBloc.state.profileEntity.autoRenewDoctor;
    enableJournalAutoPay = widget.profileBloc.state.profileEntity.autoRenewJournal;
    enableOrganizationAutoPay = widget.profileBloc.state.profileEntity.autoRenewOrganization;
    print('=======autoRenewDoctor ${widget.profileBloc.state.profileEntity.autoRenewDoctor}');
    print('=======autoRenewJournal ${widget.profileBloc.state.profileEntity.autoRenewJournal}');
    print('=======autoRenewOrganization ${widget.profileBloc.state.profileEntity.autoRenewOrganization}');
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.profileBloc,
      child: Scaffold(
        appBar: WAppBar(
          title: LocaleKeys.auto_payment.tr(),
          hasUnderline: true,
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
              child: Column(
                children: [
                  if (state.profileEntity.isDoctor || state.profileEntity.isOrganization)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.profileEntity.isDoctor ? LocaleKeys.doctorr.tr() : LocaleKeys.organizationn.tr(),
                            style: Theme.of(context).textTheme.displaySmall!.copyWith(color: dark),
                          ),
                          WCupertinoSwitch(
                            onChange: (val) {
                              if (state.profileEntity.isDoctor) {
                                enableDoctorAutoPay = val;
                              }
                              if (state.profileEntity.isOrganization) {
                                enableOrganizationAutoPay = val;
                              }
                              widget.profileBloc.add(
                                UpdateUserAutoPayStatusEvent(
                                  profileEntity: state.profileEntity.copyWith(
                                    autoRenewDoctor: enableDoctorAutoPay,
                                    autoRenewOrganization: enableOrganizationAutoPay,
                                  ),
                                ),
                              );
                            },
                            isSwitched: state.profileEntity.isDoctor ? enableDoctorAutoPay : enableOrganizationAutoPay,
                            inactiveColor: textSecondary,
                          ),
                        ],
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          LocaleKeys.journals.tr(),
                          style: Theme.of(context).textTheme.displaySmall!.copyWith(color: dark),
                        ),
                        WCupertinoSwitch(
                          onChange: (val) {
                            enableJournalAutoPay = val;
                            widget.profileBloc.add(
                              UpdateUserAutoPayStatusEvent(
                                profileEntity: state.profileEntity.copyWith(
                                  autoRenewJournal: enableJournalAutoPay,
                                ),
                              ),
                            );
                          },
                          isSwitched: enableJournalAutoPay,
                          inactiveColor: textSecondary,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
