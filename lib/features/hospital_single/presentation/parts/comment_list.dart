import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/data/singletons/storage.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/hospital_single/domain/usecases/get_comments.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_about_hospital.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class HospitalCommentList extends StatefulWidget {
  final VoidCallback onTapAll;
  final String description;

  const HospitalCommentList({required this.onTapAll,
    Key? key, required this.description})
      : super(key: key);

  @override
  State<HospitalCommentList> createState() => _HospitalCommentListState();
}

class _HospitalCommentListState extends State<HospitalCommentList> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(StorageRepository.getString('token'));
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            color: white,
            child: Html(data: widget.description),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 32, 0, 12),
            child: Text(
              LocaleKeys.reviews.tr(),
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 20),
            ),
          ),
          BlocBuilder<CommentsBloc, CommentsState>(
            builder: (context, state) {
              return Column(
                children: List.generate(
                    state.comments.length,
                    (index) => CommentAboutHospital(
                          entity: state.comments[index],
                        )),
              );
            },
          ),
          WButton(
            onTap: widget.onTapAll,
            margin: const EdgeInsets.all(16)
                .copyWith(bottom: MediaQuery.of(context).padding.bottom),
            color: commentButton,
            text: LocaleKeys.all_reviews.tr(),
            textColor: textSecondary,
          )
        ],
      ),
    );
  }
}
