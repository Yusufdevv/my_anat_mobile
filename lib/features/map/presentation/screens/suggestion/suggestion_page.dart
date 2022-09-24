import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/map/domain/usecases/get_doctors.dart';
import 'package:anatomica/features/map/domain/usecases/get_hospitals.dart';
import 'package:anatomica/features/map/presentation/blocs/doctor_list/doctor_list_bloc.dart';
import 'package:anatomica/features/map/presentation/blocs/hospital_list_bloc/hospital_list_bloc.dart';
import 'package:anatomica/features/map/presentation/screens/result_list.dart';
import 'package:anatomica/features/map/presentation/screens/suggestion_list.dart';
import 'package:anatomica/features/map/presentation/widgets/doctors_list.dart';
import 'package:anatomica/features/map/presentation/widgets/map_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SuggestionPage extends StatefulWidget {
  final double statusBarHeight;

  const SuggestionPage({required this.statusBarHeight, Key? key})
      : super(key: key);

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage>
    with TickerProviderStateMixin {
  late TabController _controller;
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: widget.statusBarHeight + 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
                          child: SvgPicture.asset(AppIcons.close),
                        ),
                      ),
                    ],
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
                    labelStyle: Theme.of(context).textTheme.headline3,
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
          ),
          const Divider(
            color: Color(0xF0F5F3),
          ),
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: TabBarView(
                    controller: _controller,
                    children: const [
                      SuggestionListScreen(),
                      SuggestionListScreen(),
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
                          controller: TextEditingController(),
                          onChanged: (value) {
                            if (_controller.index == 0) {
                            } else {}
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
