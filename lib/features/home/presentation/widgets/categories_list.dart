import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/home/domain/entities/category_entity.dart';
import 'package:anatomica/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

class CategoriesList extends StatelessWidget {
  final ScrollController scrollController;
  final FormzStatus status;
  final VoidCallback onFetchMore;
  final Function(int) onCategoryTap;
  final bool hasFetchMore;
  final List<CategoryEntity> categories;
  final int selectedCategoryIndex;
  const CategoriesList(
      {required this.scrollController,
      required this.onFetchMore,
      required this.hasFetchMore,
      required this.status,
      required this.categories,
      required this.onCategoryTap,
      required this.selectedCategoryIndex,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 45,
                    color: white,
                    width: double.maxFinite,
                  ),
                  Container(
                    height: 7,
                    width: double.maxFinite,
                    decoration: const BoxDecoration(color: white, border: Border(top: BorderSide(color: lilyWhite))),
                  ),
                ],
              )),
          SizedBox(
            height: 89,
            child: Paginator(
              physics: const ClampingScrollPhysics(),
              controller: scrollController,
              fetchMoreFunction: onFetchMore,
              hasMoreToFetch: hasFetchMore,
              errorWidget: const SizedBox(),
              paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(status),
              padding: const EdgeInsets.only(top: 12, left: 16, right: 8),
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: CategoryItem(
                    logo: categories[i].icon.file.url,
                    title: categories[i].title,
                    onTap: () {
                      onCategoryTap(i);
                    },
                    isGreen: i == selectedCategoryIndex,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
