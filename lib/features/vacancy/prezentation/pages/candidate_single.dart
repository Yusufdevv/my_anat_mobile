import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/common/presentation/widgets/sliver_tab_bardelegate.dart';
import 'package:anatomica/features/common/presentation/widgets/w_divider.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_contact_info.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/condidate_single_appbar.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/education_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/education_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/experience_item.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/licence_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:url_launcher/url_launcher.dart';

class CandidateSingleScreen extends StatefulWidget {
  const CandidateSingleScreen({Key? key}) : super(key: key);

  @override
  State<CandidateSingleScreen> createState() => _CandidateSingleScreenState();
}

class _CandidateSingleScreenState extends State<CandidateSingleScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  initState() {
    tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (context, item) {
        return [
          SliverPersistentHeader(
            delegate: SliverTabBarDelegate(
              height: 440,
              color: primary,
              child: CandidateSingleAppBar(
                onTapShare: () {
                  Share.share('something');
                },
              ),
            ),
          )
        ];
      },
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WDivider(margin: EdgeInsets.only(top: 16)),
          Container(
            height: 46,
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: darkerGreen.withOpacity(0.08),
                  offset: const Offset(0, 4),
                  blurRadius: 24,
                )
              ],
            ),
            child: TabBar(
              controller: tabController,
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              physics: const BouncingScrollPhysics(),
              unselectedLabelColor: black,
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w500),
              labelColor: darkGreen,
              labelStyle:
                  Theme.of(context).textTheme.headline1!.copyWith(fontWeight: FontWeight.w600),
              indicatorColor: primary,
              indicator: MaterialIndicator(
                height: 3,
                color: primary,
                bottomLeftRadius: 2,
                bottomRightRadius: 2,
                topLeftRadius: 2,
                topRightRadius: 2,
                tabPosition: TabPosition.bottom,
              ),
              tabs: const [
                Tab(text: 'О кандидате'),
                Tab(text: 'Образование'),
                Tab(text: 'Лицензии и сертификаты'),
                Tab(text: 'Контактные данные'),
              ],
            ),
          ),
          const WDivider(),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: [
                ListView(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(width: 1, color: lilyWhite),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VacancyTitleText(title: 'Обо мне', fontSize: 18),
                          const SizedBox(height: 8),
                          Text(
                            '''Я ответственный, проактивный, стрессоустойчивый, коммуникабельный, честный. Мои сильные стороны — хорошие управленческие и лидерские навыки, клиентоориентированность, системное мышление, позитивный настрой. Не пью, не курю, есть права категории B.
Обладаю высокой работоспособностью, умею работать в режиме многозадачности и в команде, имею развитые организационные и управленческие способности. Хобби: чтение книг, театр, опера. Женат, двое детей.
Мой общий стаж работы — более 2 лет. Личные качества: целеустремленность, амбициозность, коммуникабельность, стрессоустойчивость. Заинтересован в развитии в сфере N. Высокая самомотивация. ''',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                  fontSize: 13,
                                  color: montana,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.only(left: 16, bottom: 12),
                      child: VacancyTitleText(title: 'Опыт работы', fontSize: 18),
                    ),
                    const ExperienceItem(),
                    const SizedBox(height: 12),
                    const ExperienceItem(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 0, 16),
                      child: Text(
                        'Похожие кандидаты',
                        style: Theme.of(context)
                            .textTheme
                            .headline1!
                            .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const CandidateItemList(),
                  ],
                ),
                ListView(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
                  children: const [
                    EducationItemList(),
                    SizedBox(height: 24),
                    VacancyTitleText(title: 'Похожие кандидаты', fontSize: 18),
                    CandidateItemList(margin: EdgeInsets.zero),
                  ],
                ),
                ListView(
                  padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
                  children: const [
                    LicenceItemList(),
                    SizedBox(height: 24),
                    VacancyTitleText(title: 'Похожие кандидаты', fontSize: 18),
                    CandidateItemList(margin: EdgeInsets.zero),
                  ],
                ),
                CandidateContactInfo()
              ],
            ),
          )
        ],
      ),
    ));
  }
}
