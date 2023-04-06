part of 'most_populars_bloc.dart';

@freezed
class MostPopularsEvent with _$MostPopularsEvent {
  const factory MostPopularsEvent.getPopularDoctors() = _GetPopularDoctors;
  const factory MostPopularsEvent.getMorePopularDoctors() =
      _GetMorePopularDoctors;
  const factory MostPopularsEvent.getPopularOrgs() = _GetPopularOrgs;
  const factory MostPopularsEvent.getMorePopularOrgs() = _GetMorePopularOrgs;
}
