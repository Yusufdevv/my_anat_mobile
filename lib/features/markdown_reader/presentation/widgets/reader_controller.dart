import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/change_font_size_button.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/color_selector.dart';
import 'package:anatomica/features/markdown_reader/presentation/widgets/selec_font_family_item.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 2,
        child: Container(
          width: 300,
          //  constraints: BoxConstraints(maxHeight: (MediaQuery.of(context).size.height / 2) - 86),
          decoration: BoxDecoration(
            color: white,
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
                  color: divider,
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
                  labelColor: textColor,
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
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(width: 10),
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            itemCount: 4,
                            itemBuilder: (context, index) =>
                                SelectFontFamilyItem(isSelected: false, onTap: () {}, fontFamily: 'Averta CY'),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: Container(
                            width: 27,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [white, white.withOpacity(0)])),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
                      child: Row(
                        children: [
                          ChangeFontSizeButton(
                            onTap: () {},
                            icon: AppIcons.fontSizeDown,
                          ),
                          const Expanded(
                            child: Center(
                              child: Text(
                                '100%',
                                style: TextStyle(fontFamily: 'Averta CY', fontWeight: FontWeight.w600, fontSize: 11),
                              ),
                            ),
                          ),
                          ChangeFontSizeButton(
                            onTap: () {},
                            icon: AppIcons.fontSizeDown,
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
                          4,
                          (index) => ColorSelector(
                            color: red,
                            onTap: (value) {},
                            groupValue: red,
                            value: red,
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
}
