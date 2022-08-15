import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:anatomica/features/magazine/presentation/widgets/article_item.dart';
import 'package:anatomica/features/magazine/presentation/widgets/magazine_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MagazineSingleItem extends StatefulWidget {
  const MagazineSingleItem({Key? key}) : super(key: key);

  @override
  State<MagazineSingleItem> createState() => _MagazineSingleItemState();
}

class _MagazineSingleItemState extends State<MagazineSingleItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SvgPicture.asset(AppIcons.chevronLeft),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SvgPicture.asset(AppIcons.share),
          ),
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1.0),
            child: Container(
              color: const Color(0xFFF0F5F3),
              height: 1.0,
            )),
      ),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: MagazineItem(
                isBuyText: true,
                magazineItemEntity: MagazineItemEntity(
                    today: 'Сегодня, 16:48',
                    imageUrl:
                        'https://images.unsplash.com/photo-1657299141942-3dab1b224686?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwyMXx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                    date: 'Июнь 2022',
                    authorName: 'Феруза Алавия',
                    price: 22222,
                    title: 'Главный врач клиники Doctor D.'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.only(left: 16, bottom: 12, top: 20),
                child: Text(
                  'Статьи из выпуска',
                  style: Theme.of(context)
                      .textTheme
                      .headline1!
                      .copyWith(fontSize: 18),
                )),
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
                            'https://images.unsplash.com/photo-1660473823393-acf16f7db71f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1Nnx8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
                        date: 'Июнь 2022',
                        authorName: 'Феруза Алавия',
                        price: 123123,
                        title:
                            'Главный врач клиники Doctor D.Главный врач клиники Doct'),
                  );
                },
                childCount: 4, // 1000 list items
              ),
            ),
          ),
        ],
      ),
    );
  }
}
