part of 'doctor_articles_bloc.dart';

class DoctorArticlesState extends Equatable {
  final List<JournalArticleEntity> articles;
  final FormzStatus getArticleStatus;
  final String? next;
  final bool fetchMore;
  final int doctorId;
  const DoctorArticlesState({
    this.articles = const [],
    this.getArticleStatus = FormzStatus.pure,
    this.next = '',
    this.fetchMore = false,
    this.doctorId = 0,
  });
  DoctorArticlesState copyWith({
    List<JournalArticleEntity>? articles,
    FormzStatus? getArticleStatus,
    String? next,
    bool? fetchMore,
    int? doctorId,
  }) =>
      DoctorArticlesState(
        articles: articles ?? this.articles,
        getArticleStatus: getArticleStatus ?? this.getArticleStatus,
        next: next ?? this.next,
        fetchMore: fetchMore ?? this.fetchMore,
        doctorId: doctorId ?? this.doctorId,
      );
  @override
  List<Object?> get props => [
        articles,
        getArticleStatus,
        next,
        fetchMore,
        doctorId,
      ];
}
