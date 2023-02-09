import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/org_map_v2_bloc/org_map_v2_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/suggestion/suggestion_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctors_list.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:anatomica/features/map/presentation/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SuggestionListScreen extends StatelessWidget {
  final Function(String) onTapItem;
  final String searchText;
  final Point myPoint;
  final bool isDoctor;

  const SuggestionListScreen(
      {required this.onTapItem,
      required this.isDoctor,
      required this.searchText,
      required this.myPoint,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isDoctor
        ? DoctorsList(
            textEditingController: TextEditingController(text: searchText))
        : BlocBuilder<HospitalListBloc, HospitalListState>(
            builder: (context, state) {
              return Align(
                alignment: Alignment.topCenter,
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    // if (index == 0) {
                    //   return GestureDetector(
                    //     behavior: HitTestBehavior.opaque,
                    //     onTap: () {
                    //       // onTapItem(state.searchText);
                    //     },
                    //     child: HospitalItem(
                    //       entity: state.hospitals[index],
                    //       myPoint: myPoint,
                    //       isSuggestionItem: true,
                    //       searchText: searchText,
                    //     ),
                    //   );
                    // }
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        // onTapItem('');
                      },
                      child: HospitalItem(
                        entity: state.hospitals[index],
                        myPoint: myPoint,
                        isSuggestionItem: true,
                        searchText: searchText,
                      ),
                    );
                  },
                  itemCount: state.count,
                ),
              );
            },
          );
  }
}
