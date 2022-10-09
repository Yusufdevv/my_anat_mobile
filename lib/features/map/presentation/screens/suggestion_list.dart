import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/features/map/presentation/blocs/suggestion/suggestion_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionListScreen extends StatelessWidget {
  final Function(String) onTapItem;
  final String searchText;
  final bool isDoctor;

  const SuggestionListScreen(
      {required this.onTapItem,
      required this.isDoctor,
      required this.searchText,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionBloc, SuggestionState>(
      builder: (context, state) {
        return Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.symmetric(vertical: 2),
            decoration: BoxDecoration(
              color: textFieldColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return GestureDetector(
                      onTap: () {
                        onTapItem(state.searchText);
                      },
                      child: SuggestionItem(
                        title: state.searchText,
                        searchText: state.searchText,
                      ));
                }
                return GestureDetector(
                    onTap: () {
                      onTapItem(state.list[index - 1].title);
                    },
                    child: SuggestionItem(
                      title: state.list[index - 1].title,
                      searchText: state.searchText,
                      isLast: index == state.list.length,
                    ));
              },
              itemCount: state.list.length + 1,
            ),
          ),
        );
      },
    );
  }
}
