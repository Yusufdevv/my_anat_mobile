import 'package:flutter/cupertino.dart';

class Paginator extends StatelessWidget {
  final PaginatorStatus paginatorStatus;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final int itemCount;
  final VoidCallback fetchMoreFunction;
  final bool hasMoreToFetch;
  final Widget errorWidget;
  final EdgeInsets? padding;
  final Widget Function(BuildContext context, int index)? separateBuilder;

  const Paginator({
    required this.paginatorStatus,
    required this.itemBuilder,
    required this.itemCount,
    required this.fetchMoreFunction,
    required this.hasMoreToFetch,
    required this.errorWidget,
    this.padding = EdgeInsets.zero,
    this.separateBuilder,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paginatorStatus == PaginatorStatus.PAGINATOR_LOADING) {
      return const Center(child: CupertinoActivityIndicator());
    } else if (paginatorStatus == PaginatorStatus.PAGINATOR_ERROR) {
      return errorWidget;
    } else {
      return ListView.separated(

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
        separatorBuilder: separateBuilder ?? (context, index) => const SizedBox(),
        itemCount: itemCount + 1,
        shrinkWrap: true,
      );
    }
  }
}

enum PaginatorStatus {
  PAGINATOR_LOADING,
  PAGINATOR_SUCCESS,
  PAGINATOR_ERROR,
}
