import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/domain/entities/category_entity.dart';
import 'package:anatomica/features/home/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:formz/formz.dart';

class CategoriesAppBar extends StatelessWidget implements PreferredSizeWidget {
  final MediaQueryData mediaQuery;
  final ScrollController scrollController;
  final FormzStatus status;
  final VoidCallback onFetchMore;
  final Function(int) onCategoryTap;
  final bool hasFetchMore;
  final List<CategoryEntity> categories;
  final int selectedCategoryIndex;

  const CategoriesAppBar(
      {required this.mediaQuery,
      required this.scrollController,
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WScaleAnimation(
              onTap: () => Navigator.of(context).pop(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: SvgPicture.asset(
                  AppIcons.chevronRight,
                  color: textSecondary,
                ),
              ),
            ),
            SvgPicture.asset(AppIcons.mainLogo, height: 20),
            const SizedBox(width: 50)
          ],
        ),
        Padding(
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
                        decoration:
                            const BoxDecoration(color: white, border: Border(top: BorderSide(color: lilyWhite))),
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
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size(
        mediaQuery.size.width,
        mediaQuery.padding.top + 145,
      );
}
