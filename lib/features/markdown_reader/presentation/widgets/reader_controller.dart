import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/markdown_reader/domain/entities/named_color_entity.dart';
import 'package:anatomica/features/markdown_reader/presentation/bloc/reader_controller_bloc/reader_controller_bloc.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/change_font_size_button.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/color_selector.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/selec_font_family_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReaderController extends StatefulWidget {
  const ReaderController({
    Key? key,
  }) : super(key: key);

  @override
  State<ReaderController> createState() => _ReaderControllerState();
}

class _ReaderControllerState extends State<ReaderController> {
  late CrossFadeState crossFadeState;

  @override
  void initState() {
    crossFadeState = CrossFadeState.showFirst;
    super.initState();
  }

  final List<NamedColorEntity> colors = const [
    NamedColorEntity(color: white, name: ''),
    NamedColorEntity(color: paper, name: 'yellow'),
    NamedColorEntity(color: night, name: 'grey'),
    NamedColorEntity(color: dark, name: 'dark'),
  ];
  Color selectedColor = white;
  final List<String> fontFamily = ['Averta CY', 'IBM Plex Serif'];

  @override
  Widget build(BuildContext context) => BlocBuilder<ReaderControllerBloc, ReaderControllerState>(
        builder: (context, state) {
          return DefaultTabController(
            length: 2,
            child: Container(
              width: 300,
              //  constraints: BoxConstraints(maxHeight: (MediaQuery.of(context).size.height / 2) - 86),
              decoration: BoxDecoration(
                color: !(state.selectedColor.red > 200) ? textColor : white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                    color: grey.withOpacity(0.08),
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
                      labelStyle: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 12, color: textColor),
                      labelColor: textColor,
                      unselectedLabelColor: state.selectedTextColor,
                      onTap: (index) {
                        if (index == 0) {
                          setState(() {
                            crossFadeState = CrossFadeState.showFirst;
                          });
                        } else {
                          setState(() {
                            crossFadeState = CrossFadeState.showSecond;
                          });
                        }
                      },
                      tabs: const [
                        Tab(
                          text: 'Matn',
                        ),
                        Tab(
                          text: 'Yorug‘lik va rang',
                        ),
                      ],
                    ),
                  ),
                  AnimatedCrossFade(
                    firstChild: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              height: 82,
                              width: 300,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(
                                    fontFamily.length,
                                    (index) => SelectFontFamilyItem(
                                        selectedLabelColor: state.selectedTextColor,
                                        isSelected: state.selectedFontFamily == fontFamily[index],
                                        onTap: () {
                                          context
                                              .read<ReaderControllerBloc>()
                                              .add(SelectFontFamily(fontFamily: fontFamily[index]));
                                        },
                                        fontFamily: fontFamily[index])),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                          child: Row(
                            children: [
                              ChangeFontSizeButton(
                                onTap: () {
                                  context.read<ReaderControllerBloc>().add(DowngradeFontSize());
                                },
                                icon: AppIcons.fontSizeDown,
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    '${(state.fontSizePercentage * 100).toStringAsFixed(0)}%',
                                    style: TextStyle(
                                        fontFamily: 'Averta CY',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 11,
                                        color: state.selectedTextColor),
                                  ),
                                ),
                              ),
                              ChangeFontSizeButton(
                                onTap: () {
                                  context.read<ReaderControllerBloc>().add(UpgradeFontSize());
                                },
                                icon: AppIcons.fontSizeUp,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    secondChild: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 9).copyWith(bottom: 16),
                          child: Row(
                            children: List.generate(
                              colors.length,
                              (index) => ColorSelector(
                                color: colors[index].color,
                                onTap: (color, textColor) {
                                  context.read<ReaderControllerBloc>().add(
                                      SelectColor(textColor: textColor, color: color, colorName: colors[index].name));
                                },
                                groupValue: state.selectedColor,
                                value: colors[index].color,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    crossFadeState: crossFadeState,
                    duration: const Duration(milliseconds: 200),
                  )
                ],
              ),
            ),
          );
        },
      );
}
