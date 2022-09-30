import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/domain/entities/candidate_single.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateContactInfo extends StatelessWidget {
  final CandidateSingleEntity candidate;

  const CandidateContactInfo({required this.candidate, Key? key}) : super(key: key);

  Future<void> _launchUrl(String uri) async {
    if (!await canLaunchUrl(Uri.parse(uri))) {
      throw 'Could not launch $uri';
    } else {
      await launchUrl(Uri.parse(uri), mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Column(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: lilyWhite),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
          child: Column(
            children: [
              if (candidate.email.isNotEmpty) ...{
                CandidateContactItem(
                  onTap: () {
                    _launchUrl('mailto:${candidate.email}');
                  },
                  icon: AppIcons.vacancyMail,
                  title: candidate.email,
                ),
              },
              if (candidate.instagram.isNotEmpty) ...{
                CandidateContactItem(
                  onTap: () {
                    _launchUrl('https://www.instagram.com/${candidate.instagram}');
                  },
                  icon: AppIcons.instagram,
                  title: candidate.instagram,
                ),
              },
              if (candidate.telegram.isNotEmpty) ...{
                CandidateContactItem(
                  onTap: () {
                    _launchUrl('https://t.me/${candidate.telegram}');
                  },
                  icon: AppIcons.telegram,
                  title: candidate.telegram,
                  isLast: true,
                ),
              }
            ],
          ),
        ),
      ],
    );
  }
}

class CandidateContactItem extends StatelessWidget {
  final String icon;
  final String title;
  final bool isLast;
  final VoidCallback onTap;

  const CandidateContactItem({required this.onTap, this.isLast = false, this.title = '', this.icon = '', Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WScaleAnimation(
          onTap: onTap,
          child: Row(
            children: [
              SvgPicture.asset(icon),
              const SizedBox(width: 8),
              Text(title, style: Theme.of(context).textTheme.headline1)
            ],
          ),
        ),
        const SizedBox(height: 16),
        !isLast ? const WDivider(margin: EdgeInsets.only(bottom: 16)) : const SizedBox(),
      ],
    );
  }
}
