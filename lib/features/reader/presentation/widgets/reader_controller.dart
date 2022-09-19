// import 'package:anatomica/features/reader/presentation/bloc/brightness_bloc.dart';
// import 'package:anatomica/features/reader/presentation/widgets/change_font_size_button.dart';
// import 'package:anatomica/features/reader/presentation/widgets/color_selector.dart';
// import 'package:anatomica/features/reader/presentation/widgets/orientation_item.dart';
// import 'package:anatomica/features/reader/presentation/widgets/selec_font_family_item.dart';
// import 'package:epub_view/epub_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class ReaderController extends StatefulWidget {
//   final EpubController controller;
//
//   const ReaderController({
//     required this.controller,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   State<ReaderController> createState() => _ReaderControllerState();
// }
//
// class _ReaderControllerState extends State<ReaderController> {
//   late CrossFadeState crossFadeState;
//
//   @override
//   void initState() {
//     crossFadeState = CrossFadeState.showFirst;
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) => DefaultTabController(
//         length: 2,
//         child: Container(
//           width: 300,
//           //  constraints: BoxConstraints(maxHeight: (MediaQuery.of(context).size.height / 2) - 86),
//           decoration: BoxDecoration(
//             color: white,
//             boxShadow: [
//               BoxShadow(
//                 offset: const Offset(0, 4),
//                 blurRadius: 20,
//                 color: MyColors.C_4A4F61.withOpacity(0.08),
//               ),
//             ],
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             children: [
//               Container(
//                 height: 40,
//                 margin: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: border,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: TabBar(
//                   physics: const NeverScrollableScrollPhysics(),
//                   padding: const EdgeInsets.all(4),
//                   indicatorColor: white,
//                   indicator: BoxDecoration(
//                     color: white,
//                     boxShadow: [
//                       BoxShadow(
//                         offset: const Offset(0, 4),
//                         blurRadius: 20,
//                         color: MyColors.C_4A4F61.withOpacity(0.04),
//                       ),
//                     ],
//                     borderRadius: BorderRadius.circular(6),
//                   ),
//                   indicatorPadding: EdgeInsets.zero,
//                   indicatorWeight: 0,
//                   labelColor: MyColors.primaryColor,
//                   onTap: (index) {
//                     if (index == 0) {
//                       setState(() {
//                         crossFadeState = CrossFadeState.showFirst;
//                       });
//                     } else {
//                       setState(() {
//                         crossFadeState = CrossFadeState.showSecond;
//                       });
//                     }
//                   },
//                   tabs: const [
//                     Tab(
//                       text: 'Matn',
//                     ),
//                     Tab(
//                       text: 'Yorug‘lik va rang',
//                     ),
//                   ],
//                 ),
//               ),
//               AnimatedCrossFade(
//                 firstChild: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Stack(
//                       children: [
//                         SizedBox(
//                           height: 82,
//                           width: 300,
//                           child: ListView.separated(
//                             separatorBuilder: (context, index) => const SizedBox(width: 10),
//                             scrollDirection: Axis.horizontal,
//                             padding: const EdgeInsets.symmetric(horizontal: 12),
//                             itemCount: readerFontFamilies.values.toList().length,
//                             itemBuilder: (context, index) => SelectFontFamilyItem(
//                                 isSelected:
//                                     widget.controller.fontFamily.value == readerFontFamilies.keys.toList()[index],
//                                 onTap: () {
//                                   widget.controller.fontFamily.value = readerFontFamilies.keys.toList()[index];
//                                 },
//                                 fontFamily: readerFontFamilies.values.toList()[index]),
//                           ),
//                         ),
//                         Positioned(
//                           right: 0,
//                           top: 0,
//                           bottom: 0,
//                           child: Container(
//                             width: 27,
//                             decoration: BoxDecoration(
//                                 gradient: LinearGradient(
//                                     begin: Alignment.centerRight,
//                                     end: Alignment.centerLeft,
//                                     colors: [white, white.withOpacity(0)])),
//                           ),
//                         )
//                       ],
//                     ),
//                     const SizedBox(height: 16),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(12, 0, 12, 16),
//                       child: Row(
//                         children: [
//                           ChangeFontSizeButton(
//                             onTap: () {
//                               widget.controller.fontSize.value -= 1;
//                             },
//                             icon: MyIcons.fontSizeDown,
//                           ),
//                           Expanded(
//                             child: Center(
//                               child: Text(
//                                 '${(widget.controller.fontSize.value * (100 / 14)).toStringAsFixed(1)}%',
//                                 style:
//                                     const TextStyle(fontFamily: 'OpenSans', fontWeight: FontWeight.w600, fontSize: 11),
//                               ),
//                             ),
//                           ),
//                           ChangeFontSizeButton(
//                             onTap: () {
//                               widget.controller.fontSize.value += 1;
//                             },
//                             icon: MyIcons.fontSizeUp,
//                           ),
//                         ],
//                       ),
//                     ),
//                     OrientationItem(
//                       title: 'Tepadan pastga sahifalash',
//                       value: true,
//                       groupValue: widget.controller.isVertical.value,
//                       onChanged: (value) {
//                         widget.controller.isVertical.value = value;
//                       },
//                     ),
//                     OrientationItem(
//                       title: 'Chapdan o‘ngga sahifalash',
//                       value: false,
//                       groupValue: widget.controller.isVertical.value,
//                       onChanged: (value) {
//                         widget.controller.hideScrollView.value = true;
//
//                         widget.controller.isVertical.value = value;
//                         Future.delayed(const Duration(milliseconds: 100), () {
//                           widget.controller.hideScrollView.value = false;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 secondChild: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 9),
//                       child: Row(
//                         children: List.generate(
//                           readerBackgroundColors.values.toList().length,
//                           (index) => ColorSelector(
//                             color: readerBackgroundColors.values.toList()[index],
//                             onTap: (value) {
//                               widget.controller.color.value = value;
//                             },
//                             groupValue: widget.controller.color.value,
//                             value: readerBackgroundColors.keys.toList()[index],
//                           ),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.fromLTRB(12, 16, 12, 12),
//                       child: Row(
//                         children: [
//                           SvgPicture.asset(MyIcons.brightness),
//                           SliderTheme(
//                             data: Theme.of(context).sliderTheme.copyWith(
//                                   trackHeight: 4,
//                                   trackShape: const RoundedRectSliderTrackShape(),
//                                   thumbShape: const RoundSliderThumbShape(
//                                       enabledThumbRadius: 7, elevation: 0, pressedElevation: 0),
//                                   overlayShape: const RoundSliderOverlayShape(overlayRadius: 0),
//                                 ),
//                             child: Expanded(
//                               child: BlocBuilder<BrightnessBloc, BrightnessState>(
//                                 builder: (context, state) => Slider(
//                                   value: state.brightness,
//                                   onChanged: (value) => context.read<BrightnessBloc>().add(SetBrightness(value: value)),
//                                 ),
//                               ),
//                             ),
//                           )
//                         ],
//                       ),
//                     )
//                   ],
//                 ),
//                 crossFadeState: crossFadeState,
//                 duration: const Duration(milliseconds: 200),
//               )
//             ],
//           ),
//         ),
//       );
// }
