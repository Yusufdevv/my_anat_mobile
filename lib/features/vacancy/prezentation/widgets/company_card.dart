import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_bloc/vacancy_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/company_shimmer_card.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/image_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
class CompanyCard extends StatelessWidget {
  final VacancyBloc vacancyBloc;

  const CompanyCard({required this.vacancyBloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: vacancyBloc,
      child: BlocBuilder<VacancyBloc, VacancyState>(
        builder: (context, state) {
          print('image_url:${state.topOrganizationEntity.logo.origin}');
          if (state.topOrganizationStatus.isSubmissionSuccess) {
            return WScaleAnimation(
              onTap: () {},
              child: Row(
                children: [
                  ImageCard(imageUrl: state.topOrganizationEntity.logo.middle),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.topOrganizationEntity.title,
                        style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${state.topOrganizationEntity.vacancyCount} ${LocaleKeys.vacancies.tr()}',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                  const Spacer(),
                  SvgPicture.asset(AppIcons.arrowRight),
                  const SizedBox(width: 12)
                ],
              ),
            );
          } else if (state.topOrganizationStatus.isSubmissionInProgress) {
            return const CompanyShimmerCard();
          } else if (state.topOrganizationStatus.isSubmissionFailure) {
            return const Center(child: Text('Fail'));
          }
          return const CompanyShimmerCard();
        },
      ),
    );
  }
}
