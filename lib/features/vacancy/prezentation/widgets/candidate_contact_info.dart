import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateContactInfo extends StatelessWidget {
  const CandidateContactInfo({Key? key}) : super(key: key);

  Future<void> _launchUrl(String uri) async {
    if (!await launchUrl(Uri.parse(uri))) {
      throw 'Could not launch $uri';
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
              CandidateContactItem(
                onTap: () {
                  _launchUrl('https://gmail.com');
                },
                icon: AppIcons.vacancyMail,
                title: '7SSP@anatomica.uz',
              ),
              CandidateContactItem(
                onTap: () {
                  _launchUrl('https://www.instagram.com/ikhromov_');
                },
                icon: AppIcons.instagram,
                title: 'ikromov_',
              ),
              CandidateContactItem(
                onTap: () {
                  _launchUrl('https://telegram.me');
                },
                icon: AppIcons.telegram,
                title: 'ikhromov',
                isLast: true,
              ),
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

  const CandidateContactItem(
      {required this.onTap, this.isLast = false, this.title = '', this.icon = '', Key? key})
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
