// import 'package:anatomica/assets/colors/colors.dart';
// import 'package:anatomica/features/common/presentation/widgets/search_field.dart';
// import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
// import 'package:anatomica/features/hospital_single/data/models/service.dart';
// import 'package:anatomica/features/map/presentation/widgets/sevice_item.dart';
// import 'package:flutter/material.dart';
//
// class HospitalServices extends StatefulWidget {
//   const HospitalServices({Key? key}) : super(key: key);
//
//   @override
//   State<HospitalServices> createState() => _HospitalServicesState();
// }
//
// class _HospitalServicesState extends State<HospitalServices> {
//   late TextEditingController _textController;
//   String searchValue = '';
//   @override
//   void initState() {
//     _textController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
//       children: [
//         SearchField(
//           controller: _textController,
//           onChanged: (value) {
//             setState(() {
//               searchValue = value;
//             });
//           },
//           fillColor: white,
//         ),
//         const SizedBox(height: 16),
//         Container(
//           decoration: BoxDecoration(
//             color: white,
//             borderRadius: BorderRadius.circular(12),
//           ),
//           child: Column(
//             children: List.generate(
//               20,
//               (index) => ServiceItem(
//                 isLast: index == 19, entity: SingleServiceModel(name: '',id: 0),
//
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(height: 16),
//         WButton(
//           onTap: () {},
//           color: commentButton,
//           text: 'Загрузить еще',
//           textColor: textSecondary,
//         )
//       ],
//     );
//   }
// }
