import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/common/presentation/widgets/w_scale_animation.dart';
import 'package:anatomica/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:anatomica/features/home/presentation/parts/categories_screen.dart';
import 'package:anatomica/features/map/presentation/widgets/empty_widget.dart';
import 'package:anatomica/features/map/presentation/widgets/sevice_item.dart';
import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OtherCategoriesScreen extends StatelessWidget {
  const OtherCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: errorImageBackground,
      appBar: AppBar(
        elevation: 0.5,
        shadowColor: appBarDivider,
        titleSpacing: 0,
        leadingWidth: 0,
        title: Row(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: WScaleAnimation(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                    child: SvgPicture.asset(
                      AppIcons.chevronLeft,
                      color: textSecondary,
                    ),
                  ),
                ),
              ),
            ),
            Text(
              LocaleKeys.others_categories.tr(),
              style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const Spacer()
          ],
        ),
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return state.categories.isNotEmpty
              ? Container(
                  margin: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
                  decoration: BoxDecoration(
                      color: white, borderRadius: BorderRadius.circular(12), border: Border.all(color: lilyWhite)),
                  child: Paginator(
                    hasMoreToFetch: state.categoriesFetchMore,
                    fetchMoreFunction: () {
                      context.read<CategoryBloc>().add(const CategoryEvent.getMoreCategories());
                    },
                    paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.categoryStatus),
                    errorWidget: const Center(child: Text('error')),
                    emptyWidget: SingleChildScrollView(
                      child: EmptyWidget(
                        content: LocaleKeys.doctor_did_write_article.tr(),
                        title: LocaleKeys.doctor_did_write_article.tr(),
                      ),
                    ),
                    itemCount: state.categories.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            Navigator.of(context, rootNavigator: true).push(fade(
                                page: BlocProvider.value(
                              value: context.read<CategoryBloc>(),
                              child: CategoriesScreen(selectedIndex: index),
                            )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Row(
                              children: [
                                state.categories[index].icon.file.url.contains('http')
                                    ? SvgPicture.network(
                                        state.categories[index].icon.file.url,
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.cover,
                                      )
                                    : SvgPicture.asset(
                                        AppIcons.moreVertical,
                                        width: 24,
                                        height: 24,
                                        fit: BoxFit.cover,
                                      ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    state.categories[index].title,
                                    style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (index != state.categories.length - 1) const Divider(height: 1, indent: 50)
                      ],
                    ),
                  ))
              : Container(
                  color: white,
                  child: Center(
                    // TOdo
                    child: EmptyWidget(
                      content: LocaleKeys.nothing.tr(),
                      title: LocaleKeys.result_not_found.tr(),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
