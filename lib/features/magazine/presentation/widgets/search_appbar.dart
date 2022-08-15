// import 'package:anatomica/assets/colors/colors.dart';
// import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
// import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
// import 'package:flutter/material.dart';
// import 'package:keyboard_dismisser/keyboard_dismisser.dart';
//
// class SearchAppBar extends StatefulWidget {
//   const SearchAppBar({Key? key}) : super(key: key);
//
//   @override
//   State<SearchAppBar> createState() => _SearchAppBarState();
// }
//
// class _SearchAppBarState extends State<SearchAppBar> {
//   late TextEditingController searchController;
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       padding: EdgeInsets.fromLTRB(16, 16 + mediaQuery.padding.top, 0, 8),
//       decoration: BoxDecoration(
//         color: white,
//         boxShadow: [
//           BoxShadow(
//             color: woodSmoke.withOpacity(0.12),
//             blurRadius: 24,
//             offset: const Offset(0, 8),
//           )
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//             child: WTextField(
//               onChanged: (value) {
//                 setState(() {});
//               },
//               height: 40,
//               borderRadius: 10,
//               controller: searchController,
//               hasSearch: true,
//               enabledBorderColor: primary,
//               hintText: 'Поиск',
//               hintTextStyle: Theme.of(context).textTheme.headline3,
//               hasClearButton: true,
//               cursorColor: black,
//               textStyle: Theme.of(context)
//                   .textTheme
//                   .headline1!
//                   .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
//             ),
//           ),
//           const SizedBox(width: 8),
//           WScaleAnimation(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Text(
//               'Закрыть',
//               style: Theme.of(context)
//                   .textTheme
//                   .headline4!
//                   .copyWith(fontSize: 12),
//             ),
//           ),
//           const SizedBox(
//             width: 16,
//           )
//         ],
//       ),
//     );
//   }
// }
