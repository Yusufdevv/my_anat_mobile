part of 'header_manager_bloc.dart';

class HeaderManagerState {
  final bool isHeaderScrolled;
  final bool isScrolled;

  const HeaderManagerState({required this.isHeaderScrolled, required this.isScrolled});

  HeaderManagerState copyWith({
    bool? isHeaderScrolled,
    bool? isScrolled,
  }) =>
      HeaderManagerState(
        isHeaderScrolled: isHeaderScrolled ?? this.isHeaderScrolled,
        isScrolled: isScrolled ?? this.isScrolled,
      );
}
