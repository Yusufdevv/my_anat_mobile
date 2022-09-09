import 'package:flutter/cupertino.dart';

class Paginator extends StatelessWidget {
  final PaginatorStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget errorWidget;
  final EdgeInsets? padding;
  final bool isEmpty;
  final Widget? emptyWidget;
  final Widget Function(BuildContext context, int index)? separatorBuilder;
  final Axis scrollDirection;

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
    this.isEmpty = false,
    this.emptyWidget,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == PaginatorStatus.PAGINATOR_LOADING) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (paginatorStatus == PaginatorStatus.PAGINATOR_ERROR) {
      return errorWidget;
    } else {
      if (isEmpty) {
        return Center(child: emptyWidget);
      } else {
        return ListView.separated(
          scrollDirection: scrollDirection,
          physics: const BouncingScrollPhysics(),
          padding: padding,
          itemBuilder: (context, index) {
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
      }
    }
  }
}

enum PaginatorStatus {
  PAGINATOR_LOADING,
  PAGINATOR_SUCCESS,
  PAGINATOR_ERROR,
  PAGINATOR_INITIAL,
}
