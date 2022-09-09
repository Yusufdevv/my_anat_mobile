part of 'region_bloc.dart';

class RegionState extends Equatable {
  final PaginatorStatus regionStatus;
  final List<RegionEntity> regions;
  final bool fetchMoreRegion;
  final String? nextRegion;
  final List<DistrictEntity> districts;
  final PaginatorStatus districtStatus;
  final bool fetchMoreDistrict;
  final String? nextDistrict;
  final int? regionId;
  final bool? isCheck;
  final List<int> select;

  const RegionState({
    required this.districts,
    required this.regions,
    required this.regionStatus,
    required this.districtStatus,
    required this.fetchMoreDistrict,
    required this.fetchMoreRegion,
    this.nextDistrict,
    this.nextRegion,
    this.regionId,
    this.isCheck,
    required this.select,
  });

  RegionState copyWith({
    PaginatorStatus? regionStatus,
    List<RegionEntity>? regions,
    bool? fetchMoreRegion,
    String? nextRegion,
    List<DistrictEntity>? districts,
    PaginatorStatus? districtStatus,
    bool? fetchMoreDistrict,
    String? nextDistrict,
    int? regionId,
    bool? isCheck,
    List<int>? select,
  }) =>
      RegionState(
        districts: districts ?? this.districts,
        regions: regions ?? this.regions,
        regionStatus: regionStatus ?? this.regionStatus,
        districtStatus: districtStatus ?? this.districtStatus,
        fetchMoreDistrict: fetchMoreDistrict ?? this.fetchMoreDistrict,
        fetchMoreRegion: fetchMoreRegion ?? this.fetchMoreDistrict,
        nextDistrict: nextDistrict,
        nextRegion: nextRegion,
        regionId: regionId ?? this.regionId,
        isCheck: isCheck ?? this.isCheck,
        select: select ?? this.select,
      );

  @override
  List<Object?> get props => [
        regionStatus,
        regions,
        districts,
        districtStatus,
        nextDistrict,
        nextRegion,
        fetchMoreRegion,
        fetchMoreDistrict,
        regionId,
        isCheck,
        select,
      ];
}
