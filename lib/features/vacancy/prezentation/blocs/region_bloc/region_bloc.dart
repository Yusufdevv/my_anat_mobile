import 'package:anatomica/features/common/presentation/widgets/paginator.dart';
import 'package:anatomica/features/vacancy/domain/entities/district.dart';
import 'package:anatomica/features/vacancy/domain/entities/region.dart';
import 'package:anatomica/features/vacancy/domain/usecases/district.dart';
import 'package:anatomica/features/vacancy/domain/usecases/region.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'region_event.dart';
part 'region_state.dart';

class RegionBloc extends Bloc<RegionEvent, RegionState> {
  final RegionUseCase regionUseCase;
  final DistrictUseCase districtUseCase;

  RegionBloc({required this.districtUseCase, required this.regionUseCase})
      : super(const RegionState(
          districts: [],
          districtStatus: PaginatorStatus.PAGINATOR_INITIAL,
          regions: [],
          regionStatus: PaginatorStatus.PAGINATOR_INITIAL,
          fetchMoreDistrict: false,
          fetchMoreRegion: false,
          select: [],
        )) {
    on<GetRegionEvent>((event, emit) async {
      emit(state.copyWith(regionStatus: PaginatorStatus.PAGINATOR_LOADING));
      final response = await regionUseCase.call(const RegionParams());
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          regions: result.results,
          regionStatus: PaginatorStatus.PAGINATOR_SUCCESS,
          fetchMoreRegion: result.next != null,
          nextRegion: result.next,
        ));
      } else {
        emit(state.copyWith(regionStatus: PaginatorStatus.PAGINATOR_ERROR));
      }
    });
    on<GetMoreRegion>((event, emit) async {
      final response = await regionUseCase.call(RegionParams(next: state.nextRegion));
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          nextRegion: result.next,
          regions: [...state.regions, ...result.results],
          fetchMoreRegion: result.next != null,
          regionStatus: PaginatorStatus.PAGINATOR_SUCCESS,
        ));
      } else {
        emit(
          state.copyWith(
            regionStatus: PaginatorStatus.PAGINATOR_ERROR,
          ),
        );
      }
    });
    on<GetDistrictEvent>((event, emit) async {
      emit(state.copyWith(
          districtStatus: PaginatorStatus.PAGINATOR_SUCCESS, selectedRegionName: event.selectedRegionName));
      final response = await districtUseCase.call(DistrictParams(id: event.id));
      if (response.isRight) {
        final result = response.right;
        emit(
          state.copyWith(
            fetchMoreRegion: result.next != null,
            districtStatus: PaginatorStatus.PAGINATOR_SUCCESS,
            nextDistrict: result.next,
            districts: result.results,
          ),
        );
      }
    });
    on<GetMoreDistrict>((event, emit) async {
      final response = await districtUseCase.call(DistrictParams(next: state.nextDistrict));
      if (response.isRight) {
        final result = response.right;
        emit(state.copyWith(
          fetchMoreDistrict: result.next != null,
          nextDistrict: result.next,
          districts: [...state.districts, ...result.results],
        ));
      }
    });
  }
}
