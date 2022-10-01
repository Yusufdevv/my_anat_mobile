import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_app_bar.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/profile/data/repositories/profile_impl.dart';
import 'package:anatomica/features/profile/domain/usecases/get_faq_usecase.dart';
import 'package:anatomica/features/profile/presentation/blocs/faq_bloc/faq_bloc.dart';
import 'package:anatomica/features/profile/presentation/widgets/help_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider(
      create: (context) =>
          FaqBloc(getFaqUseCase: GetFaqUseCase(repository: serviceLocator<ProfileRepositoryImpl>()))..add(GetFaqs()),
      child: Scaffold(
        appBar: WAppBar(title: LocaleKeys.help.tr(), hasUnderline: true),
        body: BlocBuilder<FaqBloc, FaqState>(
          builder: (context, state) {
            return Paginator(
              paginatorStatus: state.status,
              itemBuilder: (context, index) => HelpItem(
                title: state.faqs[index].title,
                content: state.faqs[index].description,
              ),
              itemCount: state.faqs.length,
              fetchMoreFunction: () {
                context.read<FaqBloc>().add(GetMoreFaqs());
              },
              emptyWidget: EmptyWidget(
                title: LocaleKeys.nothing.tr(),
                content: LocaleKeys.result_not_found.tr(),
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
