import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/profile/prezentation/widgets/help_item.dart';
import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  final List<String> titleList = [
    'Вы государственная компания или частная?',
    'Сколько стоят ваши услуги?',
    'Кто может стать вашим клиентом? Пенсионер или миллионер? Для кого вы работаете?',
    'Что дает «медицинское сопровождение», которое вы предлагаете?',
    'Какие гарантии на выздоровление вы даете?',
    'Почему вы претендуете на то, что именно ваши врачи – хорошие?',
    'Как быстро вы даете ответ по запросу?',
    'Зачем указывать ориентировочную сумму, на которую я рассчитываю?',
    'Зачем указывать ориентировочную сумму, на которую я рассчитываю?',
    'Зачем указывать ориентировочную сумму, на которую я рассчитываю?',
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: const WAppBar(title: 'Помощь', hasUnderline: true),
      body: ListView.separated(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) => HelpItem(
          title: titleList[index],
          content:
              'Стоимость определяется индивидуально и зависит от сложности организации лечебного процесса.',
        ),
        separatorBuilder: (context, index) => const SizedBox(height: 12),
        itemCount: titleList.length,
      ),
    );
  }
}
