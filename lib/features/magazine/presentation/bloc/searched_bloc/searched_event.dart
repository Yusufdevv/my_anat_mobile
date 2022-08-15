part of 'searched_bloc.dart';

abstract class SearchedEvent extends Equatable {
  const SearchedEvent();
}


class RemoveSearchItem extends SearchedEvent{
  final String authorName;
  const RemoveSearchItem({required this.authorName});
  @override
  List<Object?> get props => [authorName];
}

class ClearSearchItem extends SearchedEvent{
  const ClearSearchItem();
  @override
  List<Object?> get props => [];

}