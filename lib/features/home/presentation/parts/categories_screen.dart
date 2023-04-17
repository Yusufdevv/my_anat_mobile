import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/core/utils/my_functions.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:anatomica/features/home/presentation/widgets/category_item.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_single_app_bar_body.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({required this.selectedIndex, super.key});
  final int selectedIndex;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(CategoryEvent.getOrganizations(widget.selectedIndex));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: errorImageBackground,
      appBar: AppBar(
        titleSpacing: 0,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        elevation: 0.5,
        title: const HospitalSingleAppBarBody(),
        shadowColor: textFieldColor,
      ),
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          return Stack(
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
              Positioned.fill(
                  child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 89,
                      child: Paginator(
                        fetchMoreFunction: () {
                          context.read<CategoryBloc>().add(const CategoryEvent.getMoreCategories());
                        },
                        hasMoreToFetch: state.categoriesFetchMore,
                        errorWidget: const SizedBox(),
                        paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.categoryStatus),
                        padding: const EdgeInsets.only(top: 12, left: 16, right: 8),
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (ctx, i) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CategoryItem(
                              logo: state.categories[i].icon.file.url,
                              title: state.categories[i].title,
                              onTap: () {
                                context.read<CategoryBloc>().add(CategoryEvent.getOrganizations(i));
                              },
                              isGreen: i == state.selectedCategory,
                            ),
                          );
                        },
                      ),
                    ),
                    Paginator(
                      separatorBuilder: (context, index) => const SizedBox(height: 12),
                      padding: const EdgeInsets.all(16).copyWith(bottom: MediaQuery.of(context).padding.bottom + 16),
                      emptyWidget: Padding(
                        padding: const EdgeInsets.only(top: 100),
                        child: Center(
                          child: EmptyPage(
                              title: LocaleKeys.nothing.tr(),
                              desc: LocaleKeys.result_not_found.tr(),
                              iconPath: AppIcons.emptyA),
                        ),
                      ),
                      paginatorStatus: MyFunctions.formzStatusToPaginatorStatus(state.organizationsStatus),
                      itemBuilder: (c, index) {
                        return HospitalItem(entity: state.organizations[index]);
                      },
                      itemCount: state.organizations.length,
                      fetchMoreFunction: () {
                        context.read<CategoryBloc>().add(const CategoryEvent.getMoreOrganizations());
                      },
                      hasMoreToFetch: state.organizationsFetchMore,
                      errorWidget: const SizedBox(),
                      loadingWidget: const Padding(
                        padding: EdgeInsets.only(top: 200),
                        child: Center(child: CupertinoActivityIndicator()),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          );
        },
      ),
    );
  }
}
