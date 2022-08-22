import 'package:anatomica/features/navigation/presentation/navigator.dart';
import 'package:anatomica/features/vacancy/prezentation/pages/candidate_single.dart';
import 'package:anatomica/features/vacancy/prezentation/widgets/candidate_item.dart';
import 'package:flutter/material.dart';

class CandidateItemList extends StatelessWidget {
  final EdgeInsets? margin;

  const CandidateItemList({this.margin = const EdgeInsets.symmetric(horizontal: 16), Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(top: 20),
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => CandidateItem(
        margin: margin,
        onTap: () {
          Navigator.of(context).push(fade(page: const CandidateSingleScreen()));
        },
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: 10,
    );
  }
}
