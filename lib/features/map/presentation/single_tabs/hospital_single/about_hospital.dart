// import 'package:anatomica/assets/colors/colors.dart';
// import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
// import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
// import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
// import 'package:anatomica/features/map/presentation/widgets/comment_about_hospital.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class AboutHospital extends StatefulWidget {
//   const AboutHospital({Key? key}) : super(key: key);
//
//   @override
//   State<AboutHospital> createState() => _AboutHospitalState();
// }
//
// class _AboutHospitalState extends State<AboutHospital> {
//   late CommentsBloc commentsBloc;
//
//   @override
//   void initState() {
//     commentsBloc = CommentsBloc(GetCommentsUseCase());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//       padding: const EdgeInsets.symmetric(vertical: 20),
//       children: [
//         Container(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//           color: white,
//           child: const Text('A bunch of HTML code here'),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(16, 32, 0, 12),
//           child: Text(
//             'Отзывы',
//             style:
//                 Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
//           ),
//         ),
//         BlocBuilder<CommentsBloc, CommentsState>(
//           builder: (context, state) {
//             return Column(
//               children: [
//                 ...List.generate(state.comments.length, (index) => const CommentAboutHospital())
//               ],
//             );
//           },
//         ),
//         WButton(
//           onTap: () {},
//           margin: const EdgeInsets.all(16)
//               .copyWith(bottom: MediaQuery.of(context).padding.bottom),
//           color: commentButton,
//           text: 'Все отзывы',
//           textColor: textSecondary,
//         )
//       ],
//     );
//   }
// }
