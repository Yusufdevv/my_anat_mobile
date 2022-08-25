import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';
import 'package:visibility_detector/visibility_detector.dart';

class PaginationLoader2 extends StatelessWidget  {
  final ScrollPhysics? scrollPhysics;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final List<dynamic> list;
  final FormzStatus status;
  final VoidCallback loadingCallback;
  final bool shouldLoad;

  const PaginationLoader2({
    required this.shouldLoad,
    required this.list,
    required this.loadingCallback,
    required this.status,
    Key? key,
    this.margin,
    this.scrollPhysics,
    this.padding,
  }) : super(key: key);



  @override
  Widget build(BuildContext context) => Container(
    margin: margin,
    child: SingleChildScrollView(
      padding: padding,
      physics: scrollPhysics,
      child: Column(
        children: [
          ...list,
          if (shouldLoad)
            VisibilityDetector(
              key: const Key('my-key'),
              onVisibilityChanged: (visibilityInfo) {
                final visibilityPercentage =
                    visibilityInfo.visibleFraction * 100;
                if (visibilityPercentage == 100) {
                  loadingCallback();
                }
              },
              child: status == FormzStatus.submissionFailure
                  ? const SizedBox()
                  : const CupertinoActivityIndicator(),
            )
          else
            const SizedBox()
        ],
      ),
    ),
  );
}