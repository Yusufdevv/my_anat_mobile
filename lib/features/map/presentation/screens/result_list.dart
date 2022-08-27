import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ResultList extends StatelessWidget {
  const ResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HospitalListBloc, HospitalListState>(
      builder: (context, state) {
        if(state.status==FormzStatus.submissionInProgress){
          return const Center(child: CupertinoActivityIndicator(),);
        }else if(state.status==FormzStatus.submissionSuccess){
          return ListView.separated(
            itemCount: state.hospitals.length,
            itemBuilder: (context, index) =>  HospitalItem(entity: state.hospitals[index],),
            padding: const EdgeInsets.all(16).copyWith(bottom: 266),
            separatorBuilder: (context, index) => const SizedBox(height: 12),
          );
        }else {
          return const SizedBox();
        }

      },
    );
  }
}
