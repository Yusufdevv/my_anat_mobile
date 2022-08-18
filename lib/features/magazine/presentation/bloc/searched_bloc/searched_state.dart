part of 'searched_bloc.dart';

class SearchedState extends Equatable {
  final List<String> searchedDate;

  const SearchedState({required this.searchedDate});

  SearchedState copyWith({List<String>? searchedDate}) =>
      SearchedState(searchedDate: searchedDate ?? this.searchedDate);

  @override
  List<Object?> get props => [searchedDate];
}
