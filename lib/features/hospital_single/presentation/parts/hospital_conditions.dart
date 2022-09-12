import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comforts.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/facilities/facilities_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/widgets/condition_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class HospitalConditions extends StatefulWidget {
  const HospitalConditions({Key? key}) : super(key: key);

  @override
  State<HospitalConditions> createState() => _HospitalConditionsState();
}

class _HospitalConditionsState extends State<HospitalConditions> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FacilitiesBloc, FacilitiesState>(
      builder: (context, state) {
        return GridView.builder(
          padding: const EdgeInsets.all(16)
              .copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              mainAxisExtent: 102),
          itemBuilder: (context, index) =>ConditionItem(entity: state.comforts[index],),
          itemCount: state.comforts.length,
        );
      },
    );
  }
}
