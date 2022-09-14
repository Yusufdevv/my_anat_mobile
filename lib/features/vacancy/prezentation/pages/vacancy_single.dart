import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/map/presentation/widgets/phones_bottom_sheet.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/data/repositories/vacancy_repository_impl.dart';
import 'package:anatomica/features/vacancy/domain/usecases/related_vacancy.dart';
import 'package:anatomica/features/vacancy/domain/usecases/vacancy_single.dart';
import 'package:anatomica/features/vacancy/prezentation/blocs/vacancy_single/vacancy_single_bloc.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/category_container.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/dot_text_widget.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_single_appbar.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_single_appbar_header.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_single_textwidget.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class VacancySingleScreen extends StatefulWidget {
  final String slug;

  const VacancySingleScreen({required this.slug, Key? key}) : super(key: key);

  @override
  State<VacancySingleScreen> createState() => _VacancySingleScreenState();
}

class _VacancySingleScreenState extends State<VacancySingleScreen> {
  late VacancySingleBloc _vacancySingleBloc;

  @override
  initState() {
    _vacancySingleBloc = VacancySingleBloc(
        relatedVacancyUseCase:
            RelatedVacancyListUseCase(repository: serviceLocator<VacancyRepositoryImpl>()),
        vacancySingleUseCase:
            VacancySingleUseCase(repository: serviceLocator<VacancyRepositoryImpl>()));
    _vacancySingleBloc.add(GetRelatedVacancyList(slug: widget.slug));
    super.initState();
  }

  @override
  dispose() {
    _vacancySingleBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _vacancySingleBloc),
      ],
      child: Scaffold(
        body: BlocBuilder<VacancySingleBloc, VacancySingleState>(
          builder: (context, state) {
            print('status:${state.status}');
            if (state.status.isPure) {
              context.read<VacancySingleBloc>().add(GetSingleVacancyEvent(slug: widget.slug));
            } else if (state.status.isSubmissionInProgress) {
              return const Center(child: CupertinoActivityIndicator());
            } else if (state.status.isSubmissionSuccess) {
              return NestedScrollView(
                headerSliverBuilder: (context, index) {
                  return [
                    const VacancySingleAppBar(),
                    VacancySingleAppBarHeader(vacancyEntity: state.vacancyListEntity),
                  ];
                },
                body: ListView(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VacancySingleTextWidget(
                            title:
                                '${state.vacancyListEntity.experienceFrom} - ${state.vacancyListEntity.experienceTo} лет',
                            icon: AppIcons.briefCase),
                        const SizedBox(height: 10),
                        VacancySingleTextWidget(
                            title: state.vacancyListEntity.address, icon: AppIcons.mapPin),
                        const SizedBox(height: 10),
                        VacancySingleTextWidget(
                            title:
                                '${MyFunctions.getPriceFormat(state.vacancyListEntity.salaryFrom)} - ${MyFunctions.getPriceFormat(state.vacancyListEntity.salaryTo)}',
                            icon: AppIcons.cashBanknote),
                        const SizedBox(height: 24),
                        Text(
                          LocaleKeys.about_vacancy.tr(),
                          style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        Html(
                          data: state.vacancyListEntity.description,
                          style: const {},
                        ),
                        VacancyTitleText(title: LocaleKeys.category.tr()),
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              state.vacancyListEntity.organization.speciazilation.length,
                              (index) => CategoryContainer(
                                margin: const EdgeInsets.only(right: 12),
                                onTap: () {},
                                title: state
                                    .vacancyListEntity.organization.speciazilation[index].title,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        const VacancyTitleText(title: 'Тип занятности'),
                        const SizedBox(height: 8),
                        Text(
                          state.vacancyListEntity.workType.name,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 13,
                                color: montana,
                              ),
                        ),
                        const SizedBox(height: 16),
                        VacancyTitleText(title: LocaleKeys.requirement.tr()),
                        ...List.generate(
                          state.vacancyListEntity.requirements.length,
                          (index) => RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    width: 3,
                                    height: 3,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: black,
                                    ),
                                  ),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                  text: state.vacancyListEntity.requirements[index].description,
                                  style: Theme.of(context).textTheme.headline1!.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        VacancyTitleText(title: LocaleKeys.responsible.tr()),
                        ...List.generate(
                          state.vacancyListEntity.obligations.length,
                          (index) => RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    width: 3,
                                    height: 3,
                                    margin: const EdgeInsets.only(right: 8),
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: black,
                                    ),
                                  ),
                                  alignment: PlaceholderAlignment.middle,
                                ),
                                TextSpan(
                                  text: state.vacancyListEntity.obligations[index].description,
                                  style: Theme.of(context).textTheme.headline1!.copyWith(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: white,
                              border: Border.all(width: 1, color: lilyWhite),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 8),
                                  blurRadius: 24,
                                  color: darkerGreen.withOpacity(0.09),
                                )
                              ]),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              VacancyTitleText(title: LocaleKeys.information_work.tr()),
                              // const SizedBox(height: 8),
                              Html(data: state.vacancyListEntity.description),
                              Text(
                                '${LocaleKeys.published.tr()} ${MyFunctions.getPublishedDate(state.vacancyListEntity.publishedAt)}',
                                style:
                                    Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 16),
                              WButton(
                                onTap: () {
                                  showPhonesBottomSheet(
                                      context,
                                      state.vacancyListEntity.organization.phoneNumbers
                                          .map((e) => e.phoneNumber)
                                          .toList());
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(AppIcons.phone, color: white),
                                    const SizedBox(width: 8),
                                    Text(
                                      LocaleKeys.show_number.tr(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2!
                                          .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        VacancyTitleText(
                            title:
                                '${state.relatedVacancyList.length} ${LocaleKeys.similar_vacancy.tr()}'),
                        const SizedBox(height: 16),
                        Paginator(
                          padding: const EdgeInsets.only(top: 20),
                          paginatorStatus: state.paginatorStatus,
                          errorWidget: const Text('Fail'),
                          itemBuilder: (context, index) {
                            return VacancyItem(
                              margin: EdgeInsets.zero,
                              vacancyEntity: state.relatedVacancyList[index],
                              onTap: () {
                                Navigator.of(context).push(fade(
                                    page: VacancySingleScreen(
                                        slug: state.relatedVacancyList[index].slug)));
                              },
                            );
                          },
                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                          hasMoreToFetch: state.fetchMore,
                          fetchMoreFunction: () {
                            context.read<VacancySingleBloc>().add(GetMoreRelatedVacancyList());
                          },
                          itemCount: state.relatedVacancyList.length,
                        )
                      ],
                    ),
                  ],
                ),
              );
            } else if (state.status.isSubmissionFailure) {
              return const Center(child: Text('Fail'));
            }
            return const Center(child: CupertinoActivityIndicator());
          },
        ),
      ),
    );
  }
}
