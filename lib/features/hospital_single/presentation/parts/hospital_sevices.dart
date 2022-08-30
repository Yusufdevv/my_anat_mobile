import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_services.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/sevice_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class HospitalServices extends StatefulWidget {
  const HospitalServices({Key? key}) : super(key: key);

  @override
  State<HospitalServices> createState() => _HospitalServicesState();
}

class _HospitalServicesState extends State<HospitalServices> {
  late TextEditingController _textController;
  late ServicesBloc servicesBloc;
  String searchValue = '';

  @override
  void initState() {
    servicesBloc = ServicesBloc(GetServicesUseCase())
      ..add(ServicesEvent.getComments());
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: servicesBloc,
      child: ListView(
        padding: const EdgeInsets.all(16)
            .copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
        children: [
          SearchField(
            controller: _textController,
            onChanged: (value) {
              setState(() {
                searchValue = value;
              });
            },
            fillColor: white,
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: BlocBuilder<ServicesBloc, ServicesState>(
              builder: (context, state) {
                return Column(
                  children: List.generate(
                    state.services.length,
                    (index) => ServiceItem(
                      isLast: index == state.services.length - 1,
                      entity: state.services[index],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          WButton(
            onTap: () {},
            color: commentButton,
            text: LocaleKeys.download_more.tr(),
            textColor: textSecondary,
          )
        ],
      ),
    );
  }
}
