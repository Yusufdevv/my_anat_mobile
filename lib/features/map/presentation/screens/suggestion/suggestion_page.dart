import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/map/domain/usecases/get_suggestions.dart';
import 'package:anatomica/features/map/presentation/blocs/map_organization/map_organization_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/suggestion/suggestion_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/suggestion_list.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class SuggestionPage extends StatefulWidget {
  final double statusBarHeight;
  final String? text;
  final Point myPoint;

  const SuggestionPage(
      {required this.statusBarHeight,
      required this.myPoint,
      this.text,
      Key? key})
      : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage>
    with TickerProviderStateMixin {
  late TabController _controller;
  late TextEditingController controller;
  late SuggestionBloc doctorSuggestion;
  late SuggestionBloc hospitalSuggestion;
  late FocusNode focusNode;

  @override
  void initState() {
    focusNode = FocusNode()..requestFocus();
    var useCase = GetSuggestionsUseCase();
    doctorSuggestion = SuggestionBloc(useCase)
      ..add(SuggestionEvent.changePage(1))
      ..add(SuggestionEvent.getSuggestions(widget.text ?? ''));
    hospitalSuggestion = SuggestionBloc(useCase)
      ..add(SuggestionEvent.getSuggestions(widget.text ?? ''));
    controller = TextEditingController(text: widget.text ?? '');
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + 48),
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                    child: SvgPicture.asset(AppIcons.close),
                  ),
                ),
              ),
              Container(
                height: 36,
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: textFieldColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  controller: _controller,
                  padding: EdgeInsets.zero,
                  indicatorPadding: EdgeInsets.zero,
                  indicator: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelStyle: Theme.of(context).textTheme.displaySmall,
                  labelColor: textColor,
                  onTap: (index) {},
                  unselectedLabelColor: textSecondary,
                  tabs: [
                    Tab(text: LocaleKeys.organization.tr()),
                    Tab(text: LocaleKeys.doctor.tr()),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 1,
            color: Color(0xF0F5F3),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      BlocProvider.value(
                        value: hospitalSuggestion,
                        child: SuggestionListScreen(
                          isDoctor: true,
                          myPoint: widget.myPoint,
                          searchText: controller.text,
                          onTapItem: (text) {
                            context.read<MapOrganizationBloc>().add(
                                MapOrganizationEvent.changeSearchText(text));
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      BlocProvider.value(
                        value: doctorSuggestion,
                        child: SuggestionListScreen(
                          isDoctor: true,
                          myPoint: widget.myPoint,
                          searchText: controller.text,
                          onTapItem: (text) {
                            context.read<MapOrganizationBloc>().add(
                                MapOrganizationEvent.changeSearchText(text));
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(
                            16,
                            16,
                            16,
                            16 +
                                MediaQuery.of(context).viewInsets.bottom +
                                MediaQuery.of(context).padding.bottom),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: textFieldColor),
                          color: white,
                        ),
                        child: SearchField(
                          focusNode: focusNode,
                          controller: controller,
                          onChanged: (value) {
                            if (_controller.index == 0) {
                              hospitalSuggestion
                                  .add(SuggestionEvent.getSuggestions(value));
                            } else {
                              doctorSuggestion
                                  .add(SuggestionEvent.getSuggestions(value));
                            }
                          },
                        ),
                      ),
                      // Expanded(
                      //   child: Container(
                      //     color: white,
                      //   ),
                      // )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
