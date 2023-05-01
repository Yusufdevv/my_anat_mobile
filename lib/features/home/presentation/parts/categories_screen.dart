import 'dart:developer';

import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/home/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:anatomica/features/home/presentation/widgets/categories_app_bar.dart';
import 'package:anatomica/features/map/domain/entities/org_map_v2_entity.dart';
import 'package:anatomica/features/map/presentation/widgets/hospital_item.dart';
import 'package:anatomica/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class CategoriesScreen extends StatefulWidget {
  final MediaQueryData mediaQuery;

  const CategoriesScreen(
      {required this.selectedIndex, required this.mediaQuery, required this.categoryItemSize, super.key});

  final int selectedIndex;
  final double categoryItemSize;

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late final ScrollController categoryController;
  late final ScrollController organizationsController;

  @override
  void initState() {
    super.initState();
    categoryController = ScrollController();
    organizationsController = ScrollController()..addListener(_organizationsListener);
    context.read<CategoryBloc>().add(CategoryEvent.getOrganizations(widget.selectedIndex));
    Future.delayed(const Duration(milliseconds: 200), () {
      categoryController.animateTo(widget.categoryItemSize * widget.selectedIndex,
          duration: const Duration(milliseconds: 100), curve: Curves.easeIn);
    });
  }

  _organizationsListener() {
    /// tepaga ko'tarish
    if (ScrollDirection.reverse == organizationsController.position.userScrollDirection &&
        context.read<CategoryBloc>().state.categoriesCrossFade != CrossFadeState.showSecond) {
      log(':::::::::: reverse  ${organizationsController.offset}  ::::::::::');
      context.read<CategoryBloc>().add(CategoryEvent.changeCrossFade(CrossFadeState.showSecond));
    }
    if (ScrollDirection.forward == organizationsController.position.userScrollDirection &&
        context.read<CategoryBloc>().state.categoriesCrossFade != CrossFadeState.showFirst) {
      log(':::::::::: forward   ${organizationsController.offset}  ::::::::::');
      context.read<CategoryBloc>().add(CategoryEvent.changeCrossFade(CrossFadeState.showFirst));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: errorImageBackground,
          appBar: CategoriesAppBar(
            crossFadeState: state.categoriesCrossFade,
            mediaQuery: widget.mediaQuery,
            selectedCategoryIndex: state.selectedCategory,
            onCategoryTap: (i) {
              context.read<CategoryBloc>().add(CategoryEvent.getOrganizations(i));
            },
            categories: state.categories,
            status: state.categoryStatus,
            hasFetchMore: state.categoriesFetchMore,
            scrollController: categoryController,
            onFetchMore: () {
              context.read<CategoryBloc>().add(const CategoryEvent.getMoreCategories());
            },
          ),
          body: Builder(
            builder: (context) {
              if (state.organizationsStatus.isSubmissionInProgress) {
                return const Padding(
                  padding: EdgeInsets.only(top: 200),
                  child: Center(child: CupertinoActivityIndicator()),
                );
              }
              if (state.organizations.isEmpty) {
                return Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Center(
                    child: EmptyPage(
                      title: LocaleKeys.nothing.tr(),
                      desc: LocaleKeys.result_not_found.tr(),
                      iconPath: AppIcons.emptyA,
                    ),
                  ),
                );
              }

              return NotificationListener<OverscrollIndicatorNotification>(
                onNotification: (overscroll) {
                  overscroll.disallowIndicator();
                  return true;
                },
                child: ListView.separated(
                    controller: organizationsController,
                    padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
                    itemCount: state.organizations.length + 1,
                    separatorBuilder: (c, i) => const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      if (state.organizations.isEmpty) {}

                      if (index == state.organizations.length) {
                        if (state.organizationsFetchMore) {
                          context.read<CategoryBloc>().add(const CategoryEvent.getMoreOrganizations());

                          return const SizedBox(
                            height: 140,
                            child: Center(
                              child: CupertinoActivityIndicator(),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      }
                      return HospitalItem(
                        entity: state.organizations[index],
                        wrapItems: state.organizations[index].getServiceOrSpecialization(pattern: null),
                      );
                    }),
              );
            },
          ),
        );
      },
    );
  }
}
