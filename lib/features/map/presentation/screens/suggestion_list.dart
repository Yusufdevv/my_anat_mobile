import 'package:anatomica/assets/colors/colors.dart';
import 'package:anatomica/assets/constants/app_icons.dart';
import 'package:anatomica/features/common/presentation/widgets/empty_page.dart';
import 'package:anatomica/features/map/presentation/blocs/suggestion/suggestion_bloc.dart';
import 'package:anatomica/features/map/presentation/widgets/suggestion_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SuggestionListScreen extends StatelessWidget {
  final Function(String) onTapItem;
  final String searchText;
  final bool isDoctor;

  const SuggestionListScreen({required this.onTapItem, required this.isDoctor, required this.searchText, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SuggestionBloc, SuggestionState>(
      builder: (context, state) {
        if (state.list.isEmpty) {
          return const SingleChildScrollView(
            child: Center(
              child: EmptyPage(
                title: 'Ничего не найдено',
                iconPath: AppIcons.emptyA,
                desc: 'Результаты не найдены по вашему запросу',
              ),
            ),
          );
        } else {
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
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      onTapItem(state.list[index].title);
                    },
                    child: SuggestionItem(title: state.list[index].title)),
                itemCount: state.list.length,
              ),
            ),
          );
        }
      },
    );
  }
}
