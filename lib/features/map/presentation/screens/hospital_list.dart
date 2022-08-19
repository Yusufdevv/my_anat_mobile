import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/result_list.dart';
import 'package:anatomica/features/map/presentation/screens/suggestion_list.dart';
import 'package:anatomica/features/map/presentation/widgets/map_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HospitalList extends StatefulWidget {
  final TabController controller;

  const HospitalList({required this.controller, Key? key}) : super(key: key);

  @override
  State<HospitalList> createState() => _HospitalListState();
}

class _HospitalListState extends State<HospitalList> with TickerProviderStateMixin {
  late TabController _controller;
  late TextEditingController controller;
  late HospitalListBloc bloc;

  @override
  void initState() {
    bloc = HospitalListBloc();
    controller = TextEditingController()
      ..addListener(() {
        if (controller.text.isNotEmpty) {
          bloc.add(ChangeScreenState(crossFadeState: CrossFadeState.showSecond));
        } else {
          bloc.add(ChangeScreenState(crossFadeState: CrossFadeState.showFirst));
        }
      });
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 1,
          shadowColor: textFieldColor,
          toolbarHeight: 104,
          titleSpacing: 0,
          leadingWidth: 0,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              WScaleAnimation(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                  child: SvgPicture.asset(AppIcons.chevronRight),
                ),
              ),
              Container(
                height: 36,
                padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.symmetric(horizontal: 16).copyWith(bottom: 16),
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
                  labelStyle: Theme.of(context).textTheme.headline3,
                  labelColor: textColor,
                  onTap: (index) {},
                  unselectedLabelColor: textSecondary,
                  tabs: const [
                    Tab(text: 'Организации'),
                    Tab(text: 'Врачи'),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: BlocBuilder<HospitalListBloc, HospitalListState>(
          builder: (context, state) {
            return Stack(
              children: [
                Positioned.fill(
                  child: TabBarView(
                    controller: _controller,
                    children: [
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: state.screenState == CrossFadeState.showFirst
                            ? const ResultList()
                            : const SuggestionListScreen(),
                      ),
                      AnimatedSwitcher(
                        duration: const Duration(milliseconds: 150),
                        child: state.screenState == CrossFadeState.showFirst
                            ? const ResultList()
                            : const SuggestionListScreen(),
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 150),
                  bottom: MediaQuery.of(context).viewInsets.bottom > 0
                      ? MediaQuery.of(context).viewInsets.bottom - 29
                      : MediaQuery.of(context).padding.bottom - 30,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      AnimatedCrossFade(
                        crossFadeState: state.screenState,
                        secondChild: const SizedBox(),
                        duration: const Duration(milliseconds: 150),
                        firstChild: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: MapButton.defaultButton(
                                title: 'На карте',
                                onTap: () {},
                                icon: AppIcons.mapIcon,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 45),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: textFieldColor),
                          color: white,
                        ),
                        child: SearchField(
                          controller: controller,
                          onChanged: (value) {},
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
            );
          },
        ),
      ),
    );
  }
}
