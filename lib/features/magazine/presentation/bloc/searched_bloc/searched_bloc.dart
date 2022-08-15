import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'searched_event.dart';

part 'searched_state.dart';

class SearchedBloc extends Bloc<SearchedEvent, SearchedState> {
  final List<String> authorsList;

  SearchedBloc({required this.authorsList})
      : super(SearchedState(searchedDate: authorsList)) {
    on<RemoveSearchItem>((event, emit) {
      final carsList = <String>[...state.searchedDate];
      if (carsList.contains(event.authorName)) {
        carsList.remove(event.authorName);
      }
      emit(state.copyWith(searchedDate: carsList));
    });

    on<ClearSearchItem>((event, emit) {
      emit(state.copyWith(searchedDate: []));
    });
  }
}
