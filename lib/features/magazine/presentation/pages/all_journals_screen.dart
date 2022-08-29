import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/magazine_single_item.dart';
import 'package:anatomica/features/magazine/presentation/pages/onetime_payment.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_small_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
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
                'Все выпуски',
                style: Theme.of(context).textTheme.headline3!.copyWith(fontSize: 20, color: textColor),
              ),
              const SizedBox(
                width: 56,
              )
            ],
          ),
          systemOverlayStyle:
              const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark),
        ),
        body: BlocBuilder<JournalBloc, JournalState>(
          builder: (context, state) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 364,
                mainAxisSpacing: 20,
                crossAxisSpacing: 16,
              ),
              itemCount: (state.journals.length + 1) % 2 == 0 ? state.journals.length + 1 : state.journals.length,
              itemBuilder: (context, index) {
                if (index == state.journals.length) {
                  if (state.fetchMore) {
                    context.read<JournalBloc>().add(GetMoreJournalArticles());
                  }
                  return const SizedBox.shrink();
                } else {
                  return MagazineSmallItem(
                    onButtonTap: () {
                      Navigator.of(context, rootNavigator: true).push(fade(
                          page: OneTimePayment(
                        price: state.journals[index].price,
                        title: state.journals[index].name,
                        imageUrl: state.journals[index].image.middle,
                        isJournal: false,
                        isRegistered:
                            context.read<AuthenticationBloc>().state.status == AuthenticationStatus.authenticated,
                        subtitle: state.journals[index].redaction,
                        id: state.journals[index].id,
                      )));
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        fade(
                          page: MagazineSingleItem(
                            bloc: bloc,
                            journal: state.journals[index],
                          ),
                        ),
                      );
                    },
                    journalEntity: state.journals[index],
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
