import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/auth/domain/entities/authentication_status.dart';
import 'package:anatomica/features/auth/presentation/bloc/authentication_bloc/authentication_bloc.dart';
import 'package:anatomica/features/common/presentation/widgets/register_bottom_sheet.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/presentation/blocs/home_articles_bloc/home_articles_bloc.dart';
import 'package:anatomica/features/journal/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/journal/presentation/pages/buy_subscription_payment_screen.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class BannerSingleScreen extends StatefulWidget {
  final String image;
  final int id;
  const BannerSingleScreen({required this.image, required this.id, Key? key})
      : super(key: key);

  @override
  State<BannerSingleScreen> createState() => _BannerSingleScreenState();
}

class _BannerSingleScreenState extends State<BannerSingleScreen> {
  late ScrollController _scrollController;
  ValueNotifier<bool> isShrink = ValueNotifier(false);
  late HomeArticlesBloc bloc;

  @override
  void initState() {
    bloc = HomeArticlesBloc()
      ..add(HomeArticlesEvent.getBannerSingle(id: widget.id));
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset > 200 - kToolbarHeight &&
            !isShrink.value) {
          isShrink.value = true;
        } else if (_scrollController.offset < 200 - kToolbarHeight &&
            isShrink.value) {
          isShrink.value = false;
        }
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value:
          const SystemUiOverlayStyle(statusBarIconBrightness: Brightness.dark),
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: bloc),
        ],
        child: Scaffold(
          backgroundColor: errorImageBackground,
          bottomNavigationBar:
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return BlocBuilder<JournalBloc, JournalState>(
                builder: (context, journalState) {
                  return WButton(
                    text: LocaleKeys.activate.tr(),
                    onTap: () {
                      if (state.status == AuthenticationStatus.authenticated) {
                        Navigator.of(context, rootNavigator: true).push(
                          fade(
                            page: BuySubscription(
                              images: journalState.journals
                                  .map((e) => e.image)
                                  .toList(),
                            ),
                          ),
                        );
                      } else {
                        showRegisterBottomSheet(context);
                      }
                    },
                    margin: EdgeInsets.fromLTRB(16, 16, 16,
                        MediaQuery.of(context).viewInsets.bottom + 48),
                  );
                },
              );
            },
          ),
          body: BlocBuilder<HomeArticlesBloc, HomeArticlesState>(
            builder: (context, homeState) {
              if (homeState.bannerSingleStatus !=
                  FormzStatus.submissionSuccess) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return CustomScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                          statusBarIconBrightness: isShrink.value
                              ? Brightness.dark
                              : Brightness.light),
                      pinned: true,
                      backgroundColor: errorImageBackground,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(16),
                      )),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          WScaleAnimation(
                            child: SvgPicture.asset(AppIcons.arrowLeft),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                      expandedHeight: 324,
                      elevation: 0,
                      scrolledUnderElevation: 0,
                      flexibleSpace: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 500),
                        crossFadeState: isShrink.value
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        secondChild: Container(
                          color: white,
                          height: MediaQuery.of(context).size.height,
                        ),
                        firstChild: Container(
                          foregroundDecoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                textColor.withOpacity(0.9),
                                textColor.withOpacity(0.2),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                  homeState.bannerSingle?.image.middle ?? ''),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: homeState.bannerSingle != null
                          ? Html(data: homeState.bannerSingle?.content)
                          : const SizedBox(),
                    ),
                    SliverToBoxAdapter(
                        child: SizedBox(
                            height: MediaQuery.of(context).size.height * .125))
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
