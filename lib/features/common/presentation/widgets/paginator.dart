import 'package:flutter/cupertino.dart';

class Paginator extends StatelessWidget {
  final PaginatorStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget errorWidget;
  final EdgeInsets? padding;
  final Widget? emptyWidget;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Axis scrollDirection;
  final Widget? loadingWidget;
  final ScrollPhysics physics;
  final ScrollController? controller;
  const Paginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    required this.errorWidget,
    this.padding = EdgeInsets.zero,
    this.scrollDirection = Axis.vertical,
    this.separatorBuilder,
    this.emptyWidget,
    this.loadingWidget,
    this.controller,
    this.physics = const BouncingScrollPhysics(),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == PaginatorStatus.PAGINATOR_LOADING) {
      return loadingWidget ?? const Center(child: CupertinoActivityIndicator());
    } else if (paginatorStatus == PaginatorStatus.PAGINATOR_ERROR) {
      return errorWidget;
    } else if (paginatorStatus == PaginatorStatus.PAGINATOR_SUCCESS) {
      return itemCount == 0
          ? emptyWidget ?? const SizedBox()
          : ListView.separated(
            controller: controller,
              scrollDirection: scrollDirection,
              physics: physics,
              padding: padding,
              itemBuilder: (context, index) {
                if (itemCount == 0) {
                  return emptyWidget ?? const SizedBox.shrink();
                }
                if (index == itemCount) {
                  if (hasMoreToFetch) {
                    fetchMoreFunction();
                    return const Center(child: CupertinoActivityIndicator());
                  } else {
                    return const SizedBox();
                  }
                }
                return itemBuilder(context, index);
              },
              separatorBuilder: separatorBuilder ?? (context, index) => const SizedBox(),
              itemCount: itemCount + 1,
              shrinkWrap: true,
            );
    } else {
      return const SizedBox();
    }
  }
}

enum PaginatorStatus {
  PAGINATOR_LOADING,
  PAGINATOR_SUCCESS,
  PAGINATOR_ERROR,
  PAGINATOR_INITIAL,
}
