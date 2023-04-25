part of 'map_organization_bloc.dart';

class MapOrganizationState extends Equatable {
  final MapScreenStatus screenStatus;
  final List<OrgMapV2Model> hospitals;
  final List<OrgMapV2Model> hospitalsWithDistance;
  final List<DoctorMapEntity> doctors;
  final List<TypeEntity> types;
  final List<TitlerModel> specializations;
  final List<SuggestionModel> suggestions;

  final int typesCount;
  final String? typesNext;
  final List<MapObject<dynamic>> mapObjects;
  final FormzStatus typesStatus;
  final FormzStatus tabChangingStatus;
  final bool typesFetchMore;
  final int radius;
  final FormzStatus status;
  final FormzStatus getTypesStatus;
  final FormzStatus getCurrentLocationStatus;
  final double maxZoomLevel;
  final double minZoomLevel;
  final double lat;
  final double long;
  final double currentLat;
  final double currentLong;
  final double accuracy;
  final double zoomLevel;
  final String searchText;
  final String? next;
  final bool fetchMore;
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
    this.searchText = '',
    this.accuracy = 20,
    this.zoomLevel = 0,
    this.maxZoomLevel = 0,
    this.minZoomLevel = 0,
    this.long = 0,
    this.lat = 0,
    this.status = FormzStatus.pure,
    this.next,
    this.getCurrentLocationStatus = FormzStatus.pure,
    this.mapObjects = const [],
    this.currentLat = 0,
    this.currentLong = 0,
    this.tabChangingStatus = FormzStatus.pure,
    this.hospitals = const [],
    this.hospitalsWithDistance = const [],
    this.suggestions = const [],
    this.doctors = const [],
    this.types = const [],
    this.specializations = const [],
    this.fetchMore = false,
    this.getTypesStatus = FormzStatus.pure,
    this.radius = 150,
    this.typesCount = 0,
    this.typesFetchMore = false,
    this.isSuggestion = false,
    this.isGetFocus = false,
    this.typesNext,
    this.typesStatus = FormzStatus.pure,
  });
  MapOrganizationState copyWith({
    FocusNode? focusNode,
    TextEditingController? searchController,
    MapScreenStatus? screenStatus,
    List<OrgMapV2Model>? hospitals,
    List<OrgMapV2Model>? hospitalsWithDistance,
    List<DoctorMapEntity>? doctors,
    List<TypeEntity>? types,
    List<SuggestionModel>? suggestions,
    List<TitlerModel>? specializations,
    int? typesCount,
    String? typesNext,
    List<MapObject<dynamic>>? mapObjects,
    FormzStatus? typesStatus,
    FormzStatus? tabChangingStatus,
    bool? typesFetchMore,
    int? radius,
    FormzStatus? status,
    FormzStatus? getTypesStatus,
    FormzStatus? getCurrentLocationStatus,
    double? maxZoomLevel,
    double? minZoomLevel,
    double? lat,
    double? long,
    double? currentLat,
    double? currentLong,
    double? accuracy,
    double? zoomLevel,
    String? searchText,
    String? next,
    bool? fetchMore,
    bool? isSuggestion,
    bool? isGetFocus,
  }) =>
      MapOrganizationState(
        searchController: searchController ?? this.searchController,
        suggestions: suggestions ?? this.suggestions,
        specializations: specializations ?? this.specializations,
        hospitalsWithDistance: hospitalsWithDistance ?? this.hospitalsWithDistance,
        tabController: tabController,
        screenStatus: screenStatus ?? this.screenStatus,
        searchText: searchText ?? this.searchText,
        accuracy: accuracy ?? this.accuracy,
        zoomLevel: zoomLevel ?? this.zoomLevel,
        maxZoomLevel: maxZoomLevel ?? this.maxZoomLevel,
        minZoomLevel: minZoomLevel ?? this.minZoomLevel,
        long: long ?? this.long,
        lat: lat ?? this.lat,
        status: status ?? this.status,
        next: next ?? this.next,
        getCurrentLocationStatus: getCurrentLocationStatus ?? this.getCurrentLocationStatus,
        mapObjects: mapObjects ?? this.mapObjects,
        currentLat: currentLat ?? this.currentLat,
        currentLong: currentLong ?? this.currentLong,
        tabChangingStatus: tabChangingStatus ?? this.tabChangingStatus,
        hospitals: hospitals ?? this.hospitals,
        doctors: doctors ?? this.doctors,
        types: types ?? this.types,
        fetchMore: fetchMore ?? this.fetchMore,
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
        hospitalsWithDistance,
        tabController,
        screenStatus,
        searchText,
        accuracy,
        zoomLevel,
        maxZoomLevel,
        minZoomLevel,
        long,
        lat,
        status,
        next,
        getCurrentLocationStatus,
        tabChangingStatus,
        mapObjects,
        currentLat,
        currentLong,
        hospitals,
        doctors,
        types,
        fetchMore,
        getTypesStatus,
        radius,
        typesCount,
        typesFetchMore,
        typesNext,
        typesStatus,
      ];
  /////////////////////////////////////
  bool get isSearching => focusNode.hasFocus;
  Point get myPoint => Point(latitude: currentLat, longitude: currentLong);
}
