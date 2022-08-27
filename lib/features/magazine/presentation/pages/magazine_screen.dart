import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/core/data/singletons/service_locator.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/magazine/data/repositories/journal_repository_impl.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:anatomica/features/magazine/domain/usecases/get_journal_usecase.dart';
import 'package:anatomica/features/magazine/domain/usecases/search_journal_usecase.dart';
import 'package:anatomica/features/magazine/presentation/bloc/journal_bloc/journal_bloc.dart';
import 'package:anatomica/features/magazine/presentation/pages/magazine_single_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/article_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_appbar.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_small_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MagazineScreen extends StatefulWidget {
  const MagazineScreen({Key? key}) : super(key: key);

  @override
  State<MagazineScreen> createState() => _MagazineScreenState();
}

class _MagazineScreenState extends State<MagazineScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => JournalBloc(
        getJournalUseCase: GetJournalUseCase(
          repository: serviceLocator<JournalRepositoryImpl>(),
        ),
        searchJournalUseCase: SearchJournalUseCase(
          repository: serviceLocator<JournalRepositoryImpl>(),
        ),
      )..add(GetJournals()),
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize: Size.fromHeight(64),
          child: MagazineAppBar(),
        ),
        body: BlocBuilder<JournalBloc, JournalState>(
          builder: (context, state) {
            if (state.status == PaginatorStatus.PAGINATOR_SUCCESS) {
              return CustomScrollView(
                slivers: [
                  if (state.journals.isNotEmpty) ...{
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Выпуски',
                                  style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),
                                ),
                                const Spacer(),
                                WScaleAnimation(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      Text(
                                        'Все',
                                        style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),
                                      ),
                                      SvgPicture.asset(AppIcons.arrowRight)
                                    ],
                                  ),
                                )
                              ],
                            ),
                            MagazineItem(
                              margin: const EdgeInsets.only(top: 20),
                              journalEntity: state.journals.first,
                            ),
                          ],
                        ),
                      ),
                    ),
                  },
                  SliverPadding(
                    padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                    sliver: SliverGrid(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,
                        mainAxisExtent: 370,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return MagazineSmallItem(
                            onTap: () {
                              Navigator.push(context, fade(page: const MagazineSingleItem()));
                            },
                            margin: const EdgeInsets.only(top: 20),
                            journalEntity: state.journals.skip(1).take(4).toList()[index],
                          );
                        },
                        childCount: state.journals.skip(1).take(4).length,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(image: AssetImage(AppImages.magazineBack), fit: BoxFit.cover),
                      ),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            border: Border.all(color: white1),
                            borderRadius: BorderRadius.circular(16),
                            color: white.withOpacity(0.6)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Активируйте подписку',
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 20),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Получите доступ ко всем  платным материалам и функциям приложеним.',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1!
                                  .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                WButton(
                                  borderRadius: 6,
                                  height: 34,
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  onTap: () {},
                                  child: Text(
                                    'Подробнее',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Статьи',
                                style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 24),
                              ),
                              const Spacer(),
                              WScaleAnimation(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'Все',
                                      style: Theme.of(context).textTheme.headline4!.copyWith(fontSize: 15),
                                    ),
                                    const SizedBox(width: 1),
                                    SvgPicture.asset(AppIcons.arrowRight)
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 12, bottom: 16),
                            height: 188,
                            decoration: BoxDecoration(
                                border: Border.all(color: divider), borderRadius: BorderRadius.circular(8)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                width: double.infinity,
                                imageUrl:
                                    'https://images.unsplash.com/photo-1659986854215-7b263fb9d4cf?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNzd8fHxlbnwwfHx8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Анатомика',
                              style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: 18),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Акушер-гинеколог, доктор медицинских наук, ученый секретарь Республиканского специализированного научно-практического...',
                            style: Theme.of(context)
                                .textTheme
                                .headline3!
                                .copyWith(fontSize: 13, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: EdgeInsets.only(
                      top: 6,
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).padding.bottom,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return const ArticleItem(
                            margin: EdgeInsets.only(bottom: 12),
                            magazineItemEntity: MagazineItemEntity(
                                today: 'Сегодня, 16:48',
                                imageUrl:
                                    'https://images.unsplash.com/photo-1660211999938-01fdce62e793?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw0fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                                date: 'Июнь 2022',
                                authorName: 'Феруза Алавия',
                                price: 123123,
                                title: 'Главный врач клиники Doctor D.Главный врач клиники Doct'),
                          );
                        },
                        childCount: 4, // 1000 list items
                      ),
                    ),
                  ),
                ],
              );
            } else if (state.status == PaginatorStatus.PAGINATOR_LOADING) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            } else if (state.status == PaginatorStatus.PAGINATOR_ERROR) {
              return const Center(
                child: Text('error'),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
