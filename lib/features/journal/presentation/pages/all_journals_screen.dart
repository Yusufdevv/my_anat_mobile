import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/widgets/journal_small_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllJournalsScreen extends StatelessWidget {
  final JournalBloc bloc;

  const AllJournalsScreen({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          shadowColor: textFieldColor,
          automaticallyImplyLeading: false,
          leadingWidth: 0,
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WScaleAnimation(
                onTap: () => Navigator.of(context).pop(),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: SvgPicture.asset(
                    AppIcons.chevronLeft,
                    color: textSecondary,
                  ),
                ),
              ),
              Text(
                LocaleKeys.all_journals.tr(),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 20, color: textColor),
              ),
              const SizedBox(
                width: 56,
              )
            ],
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark),
        ),
        body: BlocBuilder<JournalBloc, JournalState>(
          builder: (context, state) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16)
                  .copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 364,
                mainAxisSpacing: 20,
                crossAxisSpacing: 16,
              ),
              itemCount: state.journals.length,
              itemBuilder: (context, index) {
                if (index == state.journals.length - 1) {
                  if (state.fetchMore) {
                    context.read<JournalBloc>().add(GetMoreJournals());
                  }
                  return const SizedBox.shrink();
                } else {
                  return MagazineSmallItem(
                      journalEntity: state.journals[index]);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
