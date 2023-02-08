// import 'package:anatomica/assets/colors/colors.dart';
// import 'package:anatomica/assets/constants/app_icons.dart';
// import 'package:anatomica/features/common/presentation/widgets/highlighted_text.dart';
// import 'package:anatomica/features/map/data/models/org_map_v2_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
//
// class SuggestionItem extends StatelessWidget {
//   final OrgMapV2Model model;
//   final bool isLast;
//   final String searchText;
//
//   const SuggestionItem({
//     required this.model,
//     this.searchText = '',
//     this.isLast = false,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
//           child: Row(
//             children: [
//               SvgPicture.asset(AppIcons.search),
//               const SizedBox(width: 8),
//               Expanded(
//                 child: HighlightedText(
//                   allText: title,
//                   highlightedText: searchText,
//                   highlightColor: yellowHighlightedText,
//                   textStyle: Theme.of(context)
//                       .textTheme
//                       .displaySmall!
//                       .copyWith(color: textColor),
//                   textStyleHighlight: Theme.of(context)
//                       .textTheme
//                       .displaySmall!
//                       .copyWith(color: white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         if (!isLast) ...{
//           const Divider(
//             height: 0,
//             thickness: 1,
//             indent: 40,
//             color: dividerColor,
//           )
//         }
//       ],
//     );
//   }
// }
