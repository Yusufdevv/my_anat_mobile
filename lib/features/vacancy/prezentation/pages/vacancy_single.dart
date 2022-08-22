import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/category_container.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/dot_text_widget.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_item_list.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_single_appbar.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_single_appbar_header.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_single_textwidget.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/vacancy_title_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VacancySingleScreen extends StatefulWidget {
  const VacancySingleScreen({Key? key}) : super(key: key);

  @override
  State<VacancySingleScreen> createState() => _VacancySingleScreenState();
}

class _VacancySingleScreenState extends State<VacancySingleScreen> {
  final List<String> tList = [
    'высшее медицинское образование',
    'наличие медкнижки и действующего '
        'сертификата',
    'знание компьютера',
    'опыт работы по специальности'
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, index) {
          return [
            const VacancySingleAppBar(),
            const VacancySingleAppBarHeader(),
          ];
        },
        body: ListView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
          physics: const BouncingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VacancySingleTextWidget(title: '2 - 5 лет', icon: AppIcons.briefCase),
                const SizedBox(height: 10),
                const VacancySingleTextWidget(
                    title: 'ул.Чехова 32 Ташкент Ташкент UZ Tashkent UZ, 100015',
                    icon: AppIcons.mapPin),
                const SizedBox(height: 10),
                const VacancySingleTextWidget(
                    title: '3.000 .000 - 4.500.000', icon: AppIcons.cashBanknote),
                const SizedBox(height: 24),
                Text(
                  'О вакансии',
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  '''Стоматологическая клиника Smalto Dente предлагает Вашему вниманию услуги высокого качества.
У нас Вы можете качественно и быстро получить полный спектр стоматологических услуг. Мы проводим полное обследование для выявления причины того или иного заболевания, используя при этом исключительно высокотехнологичное оборудование ''',
                  style:
                      Theme.of(context).textTheme.bodyText2!.copyWith(color: montana, fontSize: 13),
                ),
                const SizedBox(height: 16),
                const VacancyTitleText(title: 'Категория'),
                const SizedBox(height: 8),
                Row(
                  children: const [
                    CategoryContainer(title: 'Стоматолог', margin: EdgeInsets.only(right: 12)),
                  ],
                ),
                const SizedBox(height: 16),
                const VacancyTitleText(title: 'Тип занятности'),
                const SizedBox(height: 8),
                Text(
                  'Полная занятность',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        fontSize: 13,
                        color: montana,
                      ),
                ),
                const SizedBox(height: 16),
                const VacancyTitleText(title: 'Требования'),
                DotTextWidget(list: tList),
                const SizedBox(height: 16),
                const VacancyTitleText(title: 'Обязанности'),
                DotTextWidget(list: tList),
                const SizedBox(height: 16),
                const VacancyTitleText(title: 'Обязанности'),
                DotTextWidget(list: tList),
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
                      const VacancyTitleText(title: 'Сведения о работодателе'),
                      const SizedBox(height: 8),
                      Text(
                        '''Стоматологическая клиника Smalto Dente предлагает Вашему вниманию услуги высокого качества.
У нас Вы можете качественно и быстро получить полный спектр стоматологических услуг. Мы проводим 
полное обследование для выявления причины того или иного заболевания, используя при этом исключительно высокотехнологичное оборудование''',
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: montana,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Опубликовано: 20 июнь, 2022',
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 14),
                      ),
                      const SizedBox(height: 16),
                      WButton(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(AppIcons.phone, color: white),
                            const SizedBox(width: 8),
                            Text(
                              'Показать номер',
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
                const VacancyTitleText(title: '7 похожих вакансий'),
                const SizedBox(height: 16),
                const VacancyItemList(margin: EdgeInsets.zero)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
