// import 'dart:io';
//
// import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
// import 'package:anatomica/features/reader/presentation/bloc/brightness_bloc.dart';
// import 'package:anatomica/features/reader/presentation/widgets/reader_controller.dart';
// import 'package:epub_view/epub_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class ReaderScreen extends StatefulWidget {
//   final String bookTitle;
//   static Route route({required String filePath, required String bookTitle}) => MaterialPageRoute<void>(
//         builder: (_) => ReaderScreen(
//           filePath: filePath,
//           bookTitle: bookTitle,
//         ),
//       );
//
//   final String filePath;
//
//   const ReaderScreen({required this.filePath, required this.bookTitle, Key? key}) : super(key: key);
//
//   @override
//   State<ReaderScreen> createState() => _ReaderScreenState();
// }
//
// class _ReaderScreenState extends State<ReaderScreen> {
//   late EpubController _epubController;
//   bool showController = false;
//
//   @override
//   void initState() {
//     super.initState();
//     debugLogging(widget.filePath);
//     final file = File(widget.filePath);
//     _epubController = EpubController(
//       // Load document
//       // document: EpubDocument.openAsset('assets/book3_ulamolar.epub'),
//       document: EpubDocument.openFile(file),
//       // Set start point
//       //epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
//     );
//     _epubController.isVertical.value = true;
//
//     _epubController.addListener(() {
//       setState(() {});
//     });
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _epubController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) => BlocProvider(
//         create: (context) => BrightnessBloc()..add(GetInitialBrightness()),
//         child: Scaffold(
//           backgroundColor: readerBackgroundColors[_epubController.color.value],
//           appBar: WAppBarWithButtons(
//             title: widget.bookTitle,
//             onTitleTap: () {
//               setState(() {
//                 showController = false;
//               });
//             },
//             buttons: Row(
//               children: [
//                 WScaleAnimation(
//                   onTap: () {
//                     setState(() {
//                       showController = !showController;
//                     });
//                   },
//                   child: Container(
//                     width: 30,
//                     height: 30,
//                     alignment: Alignment.centerLeft,
//                     child: SvgPicture.asset(
//                       MyIcons.setting,
//                       width: 22,
//                       height: 22,
//                       color: grey,
//                       fit: BoxFit.none,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           body: Stack(
//             children: [
//               GestureDetector(
//                 onTap: () {
//                   //print(_epubController.page.value);
//                   setState(() {
//                     showController = false;
//                   });
//                 },
//                 child: EpubView(
//                   builders: EpubViewBuilders<DefaultBuilderOptions>(
//                     options: DefaultBuilderOptions(
//                       textStyle: Theme.of(context).textTheme.headline1!.copyWith(
//                             height: 1.25,
//                             fontSize: _epubController.fontSize.value,
//                             fontFamily: readerFontFamilies[_epubController.fontFamily.value],
//                             fontFamilyFallback: [
//                               readerFontFamilies[ReaderFontFamily.openSans]!,
//                             ],
//                             backgroundColor: readerBackgroundColors[_epubController.color.value],
//                             color: readerTextColors[_epubController.color.value],
//                           ),
//                     ),
//                     chapterDividerBuilder: (_) => const Divider(),
//                     loaderBuilder: (_) => const Center(child: CircularProgressIndicator()),
//                   ),
//                   controller: _epubController,
//                 ),
//               ),
//               Positioned(
//                 top: 12,
//                 right: 20,
//                 child: AnimatedCrossFade(
//                   firstChild: ReaderController(controller: _epubController),
//                   secondChild: const SizedBox(width: 300),
//                   duration: const Duration(milliseconds: 200),
//                   crossFadeState: showController ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
// }
