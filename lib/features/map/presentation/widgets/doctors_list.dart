import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/doctor_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsList extends StatefulWidget {
  final TextEditingController textEditingController;

  const DoctorsList({required this.textEditingController, Key? key})
      : super(key: key);

  @override
  State<DoctorsList> createState() => _DoctorsListState();
}

class _DoctorsListState extends State<DoctorsList> {
  @override
  void initState() {
    // widget.textEditingController.addListener(() {
    //   context.read<DoctorListBloc>().add(DoctorListEvent.getDoctors(
    //       search: widget.textEditingController.text));
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorListBloc, DoctorListState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<DoctorListBloc>().add(DoctorListEvent.getDoctors(
                  search: widget.textEditingController.text));
              return await Future.delayed(const Duration(seconds: 1));
            },
            child: Paginator(
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                padding: const EdgeInsets.all(16).copyWith(
                    bottom: MediaQuery.of(context).padding.bottom + 136),
                emptyWidget: Center(
                  child: SingleChildScrollView(
                    child: EmptyPage(
                      title: LocaleKeys.nothing.tr(),
                      desc: LocaleKeys.result_not_found.tr(),
                      iconPath: AppIcons.emptyA,
                    ),
                  ),
                ),
                paginatorStatus:
                    MyFunctions.formzStatusToPaginatorStatus(state.status),
                itemBuilder: (c, index) {
                  return DoctorItem(
                    showPosition: false,
                    entity: state.doctors[index],
                  );
                },
                itemCount: state.doctors.length,
                fetchMoreFunction: () {
                  context
                      .read<DoctorListBloc>()
                      .add(DoctorListEvent.getMoreDoctors());
                },
                hasMoreToFetch: state.fetchMore,
                errorWidget: const SizedBox()),
          ),
        );
      },
    );
  }
}
