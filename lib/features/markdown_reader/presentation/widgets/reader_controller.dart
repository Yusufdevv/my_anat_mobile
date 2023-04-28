import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/named_color_entity.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/journal_pages_bloc/journal_pages_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/reader_controller_bloc/reader_controller_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/change_font_size_button.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReaderController extends StatefulWidget {
  const ReaderController({
    Key? key,
  }) : super(key: key);

  @override
  State<ReaderController> createState() => _ReaderControllerState();
}

class _ReaderControllerState extends State<ReaderController> with SingleTickerProviderStateMixin {
  late CrossFadeState crossFadeState;
  late TabController _tabController;

  @override
  void initState() {
    crossFadeState = CrossFadeState.showFirst;
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  final List<NamedColorEntity> colors = const [
    NamedColorEntity(color: white, name: 'toDefault()'),
    NamedColorEntity(color: paper, name: 'toYellow()'),
    NamedColorEntity(color: night, name: 'toGray()'),
    NamedColorEntity(color: dark, name: 'toDark()'),
  ];
  Color selectedColor = white;
  final List<String> fontFamily = ['Averta CY', 'IBM Plex Serif'];

  @override
  Widget build(BuildContext context) => BlocBuilder<ReaderControllerBloc, ReaderControllerState>(
        builder: (context, state) {
          print('state => ${context.read<ReaderControllerBloc>().state.journalLangg}');
          _tabController.animateTo(context.read<ReaderControllerBloc>().state.journalLangg == 'ru' ? 0 : 1);
          return BlocBuilder<JournalPagesBloc, JournalPagesState>(
            builder: (context, journalState) {
              return Container(
                margin: const EdgeInsets.all(20),
                width: 300,
                //  constraints: BoxConstraints(maxHeight: (MediaQuery.of(context).size.height / 2) - 86),
                decoration: BoxDecoration(
                  color: !(state.selectedColor.red > 200) ? textColor : white,
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 8),
                      blurRadius: 19,
                      color: chipShadowColor.withOpacity(0.19),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      margin: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TabBar(
                        controller: _tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(4),
                        indicatorColor: white,
                        indicator: BoxDecoration(
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              offset: const Offset(0, 4),
                              blurRadius: 20,
                              color: grey.withOpacity(0.04),
                            ),
                          ],
                          borderRadius: BorderRadius.circular(6),
                        ),
                        indicatorPadding: EdgeInsets.zero,
                        indicatorWeight: 0,
                        labelStyle: Theme.of(context).textTheme.displaySmall!.copyWith(fontSize: 12, color: textColor),
                        labelColor: textColor,
                        unselectedLabelColor: state.selectedTextColor,
                        onTap: (index) {
                          print('bosildi $index ${_tabController.index}');
                          context
                              .read<ReaderControllerBloc>()
                              .add(ChangeReaderLanguage(journalLang: _tabController.index == 1 ? 'uz' : 'ru'));
                        },
                        tabs: [
                          Tab(
                            text: LocaleKeys.rus.tr(),
                          ),
                          Tab(
                            text: LocaleKeys.uzb.tr(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Stack(
                        //   children: [
                        //     SizedBox(
                        //       height: 82,
                        //       width: 300,
                        //       child: Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: List.generate(
                        //             fontFamily.length,
                        //             (index) => SelectFontFamilyItem(
                        //                 selectedLabelColor: state.selectedTextColor,
                        //                 isSelected: state.selectedFontFamily == fontFamily[index],
                        //                 onTap: () {
                        //                   context
                        //                       .read<ReaderControllerBloc>()
                        //                       .add(SelectFontFamily(fontFamily: fontFamily[index]));
                        //                 },
                        //                 fontFamily: fontFamily[index])),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(height: 16),
                        // Padding(
                        //   padding: const EdgeInsets.symmetric(horizontal: 9).copyWith(bottom: 16),
                        //   child: Row(
                        //     children: List.generate(
                        //       colors.length,
                        //       (index) => ColorSelector(
                        //         color: colors[index].color,
                        //         onTap: (color, textColor) {
                        //           context.read<ReaderControllerBloc>().add(
                        //               SelectColor(textColor: textColor, color: color, colorName: colors[index].name));
                        //         },
                        //         groupValue: state.selectedColor,
                        //         value: colors[index].color,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                          child: Row(
                            children: [
                              ChangeFontSizeButton(
                                iconColor: state.selectedTextColor,
                                onTap: () {
                                  context.read<ReaderControllerBloc>().add(DowngradeFontSize());
                                  context.read<JournalPagesBloc>().add(JournalDownGradeFontSizeEvent());
                                },
                                icon: AppIcons.fontSizeDown,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '${sizesInPercentage[journalState.fontSizeIndex]}%',
                                    style: TextStyle(
                                      fontFamily: 'Averta CY',
                                      fontWeight: FontWeight.w600,
                                      fontSize: 11,
                                      color: state.selectedTextColor,
                                    ),
                                  ),
                                ),
                              ),
                              ChangeFontSizeButton(
                                onTap: () {
                                  context.read<ReaderControllerBloc>().add(UpgradeFontSize());

                                  context.read<JournalPagesBloc>().add(JournalUpgradeFontSizeEvent());
                                },
                                iconColor: state.selectedTextColor,
                                icon: AppIcons.fontSizeUp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
      );
}
