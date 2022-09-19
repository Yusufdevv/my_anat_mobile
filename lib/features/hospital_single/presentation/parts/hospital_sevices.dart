import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/services/services_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/sevice_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class HospitalServices extends StatefulWidget {
  const HospitalServices({Key? key}) : super(key: key);

  @override
  State<HospitalServices> createState() => _HospitalServicesState();
}

class _HospitalServicesState extends State<HospitalServices> {
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServicesBloc, ServicesState>(
      builder: (context, state) {
        return ListView(
          padding: state.services.isNotEmpty
              ? const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16)
              : EdgeInsets.zero,
          children: [
            Padding(
              padding: state.services.isNotEmpty ? EdgeInsets.zero : const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: SearchField(
                controller: _textController,
                onChanged: (value) {
                  context.read<ServicesBloc>().add(ServicesEvent.searchServices(query: value));
                },
                fillColor: white,
              ),
            ),
            const SizedBox(height: 16),
            if (state.status.isSubmissionInProgress) ...{
              const Center(
                child: CupertinoActivityIndicator(),
              )
            } else if (state.status.isSubmissionSuccess) ...{
              if (state.services.isEmpty) ...{
                const EmptyWidget(
                  title: 'Servislar mavjud emas!',
                  content: 'Bu klinikada servislar mavjud emas!',
                )
              } else ...{
                Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: List.generate(
                      state.services.length,
                      (index) => ServiceItem(
                        hightlightedText: state.searchQuery,
                        isLast: index == state.services.length - 1,
                        entity: state.services[index],
                      ),
                    ),
                  ),
                )
              }
            } else if (state.status.isSubmissionFailure) ...{
              const Center(
                child: Text('error'),
              )
            },
            const SizedBox(height: 16),
            if (state.fetchMore) ...{
              if (state.paginationStatus.isSubmissionInProgress) ...{
                const Center(
                  child: CupertinoActivityIndicator(),
                )
              } else ...{
                WButton(
                  onTap: () {
                    context.read<ServicesBloc>().add(ServicesEvent.getMoreServices());
                  },
                  color: commentButton,
                  text: LocaleKeys.download_more.tr(),
                  textColor: textSecondary,
                )
              },
            }
          ],
        );
      },
    );
  }
}
