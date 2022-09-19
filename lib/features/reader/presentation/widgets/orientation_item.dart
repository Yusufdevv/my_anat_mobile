// import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
// import 'package:flutter/material.dart';
//
// class OrientationItem extends StatelessWidget {
//   final String title;
//   final ValueChanged<bool> onChanged;
//   final bool value;
//   final bool groupValue;
//
//   const OrientationItem({
//     required this.value,
//     required this.title,
//     required this.groupValue,
//     required this.onChanged,
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Column(
//         children: [
//           const Divider(
//             height: 0,
//             thickness: 1,
//             indent: 12,
//             color: MyColors.C_F1F3F8,
//           ),
//           WScaleAnimation(
//             onTap: () {
//               onChanged(value);
//             },
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Row(
//                 children: [
//                   WRadio(
//                       onChanged: (_) {
//                         onChanged(value);
//                       },
//                       value: value.hashCode,
//                       groupValue: groupValue.hashCode),
//                   const SizedBox(width: 6),
//                   Text(
//                     title,
//                     style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 14, fontWeight: FontWeight.w700),
//                   )
//                 ],
//               ),
//             ),
//           )
//         ],
//       );
// }
