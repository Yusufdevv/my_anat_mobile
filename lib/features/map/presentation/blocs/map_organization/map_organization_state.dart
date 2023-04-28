part of 'map_organization_bloc.dart';

class MapOrganizationState extends Equatable {
  final MapScreenStatus screenStatus;
  final List<OrgMapV2Model> hospitals;
  final List<DoctorMapEntity> doctors;
  final List<TypeEntity> typess;
  final List<TitlerModel> specializations;
  final List<SuggestionModel> suggestions;

  final int typesCount;
  final List<MapObject<dynamic>> mapObjects;
  final FormzStatus typesStatus;
  final FormzStatus tabChangingStatus;
  final int radius;
  final FormzStatus status;
  final FormzStatus getTypesStatus;
  final FormzStatus getCurrentLocationStatus;
  final double maxZoomLevel;
  final double minZoomLevel;

  final double currentLat;
  final double currentLong;
  final double accuracy;
  final double zoomLevel;
  final String? hospitalsNext;
  final String? doctorsNext;
  final bool isSuggestion;
  final bool isGetFocus;
  final FocusNode focusNode;
  final TabController tabController;
  final TextEditingController searchController;

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
    this.suggestions = const [],
    this.doctors = const [],
    this.typess = const [],
    this.specializations = const [],
    this.getTypesStatus = FormzStatus.pure,
    this.radius = 150,
    this.typesCount = 0,
    this.isSuggestion = false,
    this.isGetFocus = false,
    this.doctorsNext,
    this.typesStatus = FormzStatus.pure,
  });
  MapOrganizationState copyWith({
    FocusNode? focusNode,
    TextEditingController? searchController,
    MapScreenStatus? screenStatus,
    List<OrgMapV2Model>? hospitals,
    List<DoctorMapEntity>? doctors,
    List<TypeEntity>? typess,
    List<SuggestionModel>? suggestions,
    List<TitlerModel>? specializations,
    List<MapObject<dynamic>>? mapObjects,
    FormzStatus? typesStatus,
    FormzStatus? tabChangingStatus,
    FormzStatus? status,
    FormzStatus? getTypesStatus,
    FormzStatus? getCurrentLocationStatus,
    int? typesCount,
    int? radius,
    double? maxZoomLevel,
    double? minZoomLevel,
    double? currentLat,
    double? currentLong,
    double? accuracy,
    double? zoomLevel,
    String? hospitalsNext,
    String? doctorsNext,
    bool? isSuggestion,
    bool? isGetFocus,
  }) =>
      MapOrganizationState(
        searchController: searchController ?? this.searchController,
        suggestions: suggestions ?? this.suggestions,
        specializations: specializations ?? this.specializations,
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
        typess: typess ?? this.typess,
        getTypesStatus: getTypesStatus ?? this.getTypesStatus,
        radius: radius ?? this.radius,
        typesCount: typesCount ?? this.typesCount,
        isSuggestion: isSuggestion ?? this.isSuggestion,
        isGetFocus: isGetFocus ?? this.isGetFocus,
        focusNode: focusNode ?? this.focusNode,
      );

  @override
  List<Object?> get props => [
        focusNode,
        searchController,
        isGetFocus,
        suggestions,
        specializations,
        isSuggestion,
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
        typess,
        getTypesStatus,
        radius,
        typesCount,
        typesStatus,
      ];
  /////////////////////////////////////
  bool get isSearching => focusNode.hasFocus;
  Point get myPoint => Point(latitude: currentLat, longitude: currentLong);
}
