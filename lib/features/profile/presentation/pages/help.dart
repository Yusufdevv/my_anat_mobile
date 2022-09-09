import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/get_faq_usecase.dart';
import 'package:anatomica/features/profile/presentation/blocs/faq_bloc/faq_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/help_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocProvider(
      create: (context) =>
          FaqBloc(getFaqUseCase: GetFaqUseCase(repository: serviceLocator<ProfileRepositoryImpl>()))..add(GetFaqs()),
      child: Scaffold(
        appBar: const WAppBar(title: 'Помощь', hasUnderline: true),
        body: BlocBuilder<FaqBloc, FaqState>(
          builder: (context, state) {
            return Paginator(
              isEmpty: state.faqs.isEmpty,
              paginatorStatus: state.status,
              itemBuilder: (context, index) => HelpItem(
                title: state.faqs[index].title,
                content: state.faqs[index].description,
              ),
              itemCount: state.faqs.length,
              fetchMoreFunction: () {
                context.read<FaqBloc>().add(GetMoreFaqs());
              },
              emptyWidget: Text(
                'Ma\'lumot yo\'q',
                style: Theme.of(context).textTheme.headline1,
              ),
              hasMoreToFetch: state.fetchMore,
              padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + mediaQuery.padding.bottom),
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              errorWidget: const Text('error'),
            );
          },
        ),
      ),
    );
  }
}
