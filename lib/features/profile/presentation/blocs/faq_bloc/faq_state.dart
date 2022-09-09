part of 'faq_bloc.dart';

class FaqState extends Equatable {
  final String? next;
  final PaginatorStatus status;
  final bool fetchMore;
  final List<FaqEntity> faqs;
  const FaqState({
    required this.status,
    required this.next,
    required this.fetchMore,
    required this.faqs,
  });

  FaqState copyWith({
    String? next,
    PaginatorStatus? status,
    bool? fetchMore,
    List<FaqEntity>? faqs,
  }) =>
      FaqState(
          status: status ?? this.status, next: next, fetchMore: fetchMore ?? this.fetchMore, faqs: faqs ?? this.faqs);

  @override
  List<Object?> get props => [
        status,
        next,
        fetchMore,
        faqs,
      ];
}
