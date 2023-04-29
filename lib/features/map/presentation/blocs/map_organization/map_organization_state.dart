part of 'map_organization_bloc.dart';

class MapOrganizationState extends Equatable {
  final MapScreenStatus screenStatus;
  final List<OrgMapV2Model> hospitals;
  final List<DoctorMapEntity> doctors;
  final List<MapObject<dynamic>> mapObjects;
  final FormzStatus tabChangingStatus;
  final FormzStatus status;
  final FormzStatus getCurrentLocationStatus;
  final TabController tabController;
  final TextEditingController searchController;
  final FocusNode focusNode;
  final int radius;
  final double maxZoomLevel;
  final double minZoomLevel;
  final double currentLat;
  final double currentLong;
  final double accuracy;
  final double zoomLevel;
  final String? hospitalsNext;
  final String? doctorsNext;
  final bool isGetFocus;
  final bool unUsed;

  const MapOrganizationState({
    required this.tabController,
    required this.searchController,
    required this.focusNode,
    this.screenStatus = MapScreenStatus.map,
    this.accuracy = 20,
    this.zoomLevel = 0,
    this.maxZoomLevel = 0,
    this.minZoomLevel = 0,
    this.status = FormzStatus.pure,
    this.hospitalsNext,
    this.getCurrentLocationStatus = FormzStatus.pure,
    this.mapObjects = const [],
    this.currentLat = 0,
    this.currentLong = 0,
    this.tabChangingStatus = FormzStatus.pure,
    this.hospitals = const [],
    this.doctors = const [],
    this.radius = 150,
    this.isGetFocus = false,
    this.unUsed = false,
    this.doctorsNext,
  });
  MapOrganizationState copyWith({
    List<OrgMapV2Model>? hospitals,
    List<DoctorMapEntity>? doctors,
    List<MapObject<dynamic>>? mapObjects,
    MapScreenStatus? screenStatus,
    TextEditingController? searchController,
    FocusNode? focusNode,
    FormzStatus? tabChangingStatus,
    FormzStatus? status,
    FormzStatus? getCurrentLocationStatus,
    int? radius,
    double? maxZoomLevel,
    double? minZoomLevel,
    double? currentLat,
    double? currentLong,
    double? accuracy,
    double? zoomLevel,
    String? hospitalsNext,
    String? doctorsNext,
    bool? isGetFocus,
    bool? unUsed,
  }) =>
      MapOrganizationState(
        searchController: searchController ?? this.searchController,
        tabController: tabController,
        screenStatus: screenStatus ?? this.screenStatus,
        accuracy: accuracy ?? this.accuracy,
        zoomLevel: zoomLevel ?? this.zoomLevel,
        maxZoomLevel: maxZoomLevel ?? this.maxZoomLevel,
        minZoomLevel: minZoomLevel ?? this.minZoomLevel,
        status: status ?? this.status,
        hospitalsNext: MyFunctions.returnNullIfEmpty(v: hospitalsNext, origin: this.hospitalsNext),
        doctorsNext: MyFunctions.returnNullIfEmpty(v: doctorsNext, origin: this.doctorsNext),
        getCurrentLocationStatus: getCurrentLocationStatus ?? this.getCurrentLocationStatus,
        mapObjects: mapObjects ?? this.mapObjects,
        currentLat: currentLat ?? this.currentLat,
        currentLong: currentLong ?? this.currentLong,
        tabChangingStatus: tabChangingStatus ?? this.tabChangingStatus,
        hospitals: hospitals ?? this.hospitals,
        doctors: doctors ?? this.doctors,
        radius: radius ?? this.radius,
        isGetFocus: isGetFocus ?? this.isGetFocus,
        focusNode: focusNode ?? this.focusNode,
        unUsed: unUsed ?? this.unUsed,
      );

  @override
  List<Object?> get props => [
        unUsed,
        focusNode,
        searchController,
        isGetFocus,
        tabController,
        screenStatus,
        accuracy,
        zoomLevel,
        maxZoomLevel,
        minZoomLevel,
        status,
        hospitalsNext,
        getCurrentLocationStatus,
        tabChangingStatus,
        mapObjects,
        currentLat,
        currentLong,
        hospitals,
        doctors,
        radius,
      ];
  /////////////////////////////////////
  bool get isSearching => focusNode.hasFocus;
  Point get myPoint => Point(latitude: currentLat, longitude: currentLong);
}
