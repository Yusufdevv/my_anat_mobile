import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/related_candidate_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class AboutCandidate extends StatelessWidget {
  final MediaQueryData mediaQuery;
  final int candidateId;
  final String bio;
  final bool showBio;
  final bool isRelatedEmpty;

  const AboutCandidate({
    Key? key,
    required this.mediaQuery,
    required this.candidateId,
    required this.bio,
    required this.showBio,
    required this.isRelatedEmpty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.fromLTRB(0, 16, 0, 16 + mediaQuery.padding.bottom),
      children: [
        if (showBio) ...[
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(width: 1, color: lilyWhite),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VacancyTitleText(title: LocaleKeys.about_me.tr(), fontSize: 18),
                //   const SizedBox(height: 8),
                Transform.translate(
                  offset: const Offset(-6, -6),
                  child: Html(
                    data: bio,
                    shrinkWrap: true,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
        ExperienceItemList(candidateId: candidateId),
        if (!isRelatedEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 0, 16),
            child: Text(
              LocaleKeys.candidates.tr(),
              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ),
          RelatedCandidateList(id: candidateId),
        ]
      ],
    );
  }
}
