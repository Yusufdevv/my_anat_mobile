import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/auth/domain/entities/image_entity.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_image.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/comments/comments_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/bloc/hospital_single/hospital_single_bloc.dart';
import 'package:anatomica/features/hospital_single/presentation/parts/image_single_screen.dart';
import 'package:anatomica/features/map/presentation/widgets/comment_about_hospital.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:formz/formz.dart';

class HospitalCommentList extends StatelessWidget {
  final VoidCallback onTapAll;
  final String description;
  final List<ImageEntity> images;

  const HospitalCommentList(
      {required this.onTapAll,
      required this.images,
      Key? key,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<CommentsBloc, CommentsState>(
        builder: (context, state) {
          return BlocBuilder<HospitalSingleBloc, HospitalSingleState>(
            builder: (context, hospitalSingleState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (hospitalSingleState.status.isSubmissionSuccess) ...{
                    if (description.isNotEmpty || images.isNotEmpty) ...{
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        color: white,
                        child: Column(
                          children: [
                            Html(data: description),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.only(
                                  top: description.isNotEmpty ? 16 : 0),
                              shrinkWrap: true,
                              itemCount: images.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16,
                                mainAxisSpacing: 16,
                                mainAxisExtent: 88,
                              ),
                              itemBuilder: (context, index) => GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(fade(
                                      page: ImageSingleScreen(
                                    images: images,
                                    index: index,
                                  )));
                                },
                                child: WImage(
                                  imageUrl: images[index].middle,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    } else ...{
                      SizedBox(
                        width: double.maxFinite,
                        child: EmptyWidget(
                          title: LocaleKeys.no_info.tr(),
                          content: LocaleKeys.no_info.tr(),
                        ),
                      ),
                    },
                  },
                  if (state.comments.isNotEmpty) ...[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 32, 0, 12),
                      child: Text(
                        LocaleKeys.reviews.tr(),
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontSize: 20),
                      ),
                    ),
                    Column(
                      children: List.generate(
                        state.comments.take(3).length,
                        (index) => CommentAboutHospital(
                          entity: state.comments[index],
                        ),
                      ),
                    ),
                    if (state.comments.length > 3) ...{
                      WButton(
                        onTap: onTapAll,
                        margin: const EdgeInsets.all(16).copyWith(
                            bottom: MediaQuery.of(context).padding.bottom + 16),
                        color: commentButton,
                        text: LocaleKeys.all_reviews.tr(),
                        textColor: textSecondary,
                      )
                    }
                  ]
                ],
              );
            },
          );
        },
      ),
    );
  }
}
