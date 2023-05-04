import 'package:anatomica/features/common/presentation/widgets/w_keyboard_dismisser.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/organization_list.dart';
import 'package:anatomica/features/map/presentation/widgets/doctors_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HospitalList extends StatelessWidget {
  const HospitalList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WKeyboardDismisser(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocBuilder<MapOrganizationBloc, MapOrganizationState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: 147),
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: state.tabController,
                children: [
                  const OrganizationList(),
                  DoctorsList(textEditingController: state.searchController),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
