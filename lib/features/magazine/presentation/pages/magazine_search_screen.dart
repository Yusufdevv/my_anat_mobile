import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_images.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/common/presentation/widgets/w_textfield.dart';
import 'package:anatomica/features/magazine/domain/entity/magazine_item_entity.dart';
import 'package:anatomica/features/magazine/presentation/bloc/searched_bloc/searched_bloc.dart';
import 'package:anatomica/features/magazine/presentation/widgets/search_model_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MagazineSearchScreen extends StatefulWidget {
  const MagazineSearchScreen({Key? key}) : super(key: key);

  @override
  State<MagazineSearchScreen> createState() => _MagazineSearchScreenState();
}

class _MagazineSearchScreenState extends State<MagazineSearchScreen> {
  late SearchedBloc searchedBloc;
  late TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    searchedBloc = SearchedBloc(authorsList: searchedCars);
    super.initState();
  }

  @override
  void dispose() {
    searchController
      ..dispose()
      ..clear();
    super.dispose();
  }

  final List<MagazineItemEntity> searchItemEntity = [
    const MagazineItemEntity(
        title: '',
        imageUrl:
            'https://images.unsplash.com/photo-1660312781383-160cd6297d70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
        authorName: 'Джамшид Мукимов',
        date: 'Май 2022',
        price: 6990),
    const MagazineItemEntity(
        title: '',
        imageUrl:
            'https://images.unsplash.com/photo-1660312781383-160cd6297d70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
        authorName: 'Ойбарчин Худжаева',
        date: 'Апрель 2022',
        price: 6990),
    const MagazineItemEntity(
        title: '',
        imageUrl:
            'https://images.unsplash.com/photo-1660312781383-160cd6297d70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
        authorName: 'Джамшид Мукимов',
        date: 'Март 2022',
        price: 6990),
    const MagazineItemEntity(
        title: 'BMW Xdrive',
        imageUrl:
            'https://images.unsplash.com/photo-1660312781383-160cd6297d70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
        authorName: 'Джамшид Мукимов',
        date: 'Май 2022',
        price: 6990),
    const MagazineItemEntity(
        title: '',
        imageUrl:
            'https://images.unsplash.com/photo-1660312781383-160cd6297d70?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
        authorName: 'Ойбарчин Худжаева',
        date: 'Февраль 2022',
        price: 6990),
  ];

  List<String> searchedCars = [
    'Май 2022',
    'Апрель 2022',
    'Март 2022',
    'Февраль 2022',
  ];

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return BlocProvider.value(
      value: searchedBloc,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(64),
          child: Container(
            padding: EdgeInsets.fromLTRB(16, 16 + mediaQuery.padding.top, 0, 8),
            decoration: BoxDecoration(
              color: white,
              boxShadow: [
                BoxShadow(
                  color: woodSmoke.withOpacity(0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                )
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: WTextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    height: 40,
                    borderRadius: 10,
                    controller: searchController,
                    hasSearch: true,
                    enabledBorderColor: primary,
                    hintText: 'Поиск',
                    hintTextStyle: Theme.of(context).textTheme.headline3,
                    hasClearButton: true,
                    cursorColor: black,
                    textStyle: Theme.of(context)
                        .textTheme
                        .headline1!
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(width: 8),
                WScaleAnimation(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Закрыть',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(fontSize: 12),
                  ),
                ),
                const SizedBox(
                  width: 16,
                )
              ],
            ),
          ),
        ),
        body: BlocBuilder<SearchedBloc, SearchedState>(
          builder: (context, state) {
            if (searchController.text.isNotEmpty) {
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: 370,
                                  childAspectRatio: 2,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16),
                          itemCount: searchItemEntity.length,
                          itemBuilder: (BuildContext ctx, index) {
                            return SearchedModelsItem(
                              controller: searchController,
                              magazineItemEntity: searchItemEntity[index],
                            );
                          }),
                      // child: ListView(
                      //   children: [
                      //     ...List.generate(
                      //       searchItemEntity.length,
                      //       (index) =>
                      //     )
                      //   ],
                      // ),
                    ),
                  ],
                ),
              );
            } else {
              return Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 160,
                        width: 160,
                        child: Image.asset(AppImages.illustrations)),
                    Text(
                      'Пока нет результатов',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 20),
                    ),
                    Text(
                      'По вашему запросу мы не могли найти ничего',
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
