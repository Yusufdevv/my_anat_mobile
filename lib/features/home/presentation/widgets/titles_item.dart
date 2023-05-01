import 'package:anatomica/features/common/presentation/widgets/w_button.dart';
import 'package:flutter/material.dart';

class TitlesItem extends StatelessWidget {
  final String title;
  final String? showAllTitle;
  final VoidCallback? showAllFunction;

  const TitlesItem({required this.title, this.showAllFunction, this.showAllTitle, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.displayLarge!.copyWith(fontSize: 20),
          ),
          Offstage(
            offstage: showAllTitle == null,
            child: WButton(
              color: Colors.transparent,
              onTap: showAllFunction ?? () {},
              text: showAllTitle ?? '',
              textStyle: Theme.of(context).textTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}
