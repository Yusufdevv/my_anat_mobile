part of 'facilities_bloc.dart';

@Freezed()
 class FacilitiesState with _$FacilitiesState {
   factory FacilitiesState({
     @Default([]) List<ComfortEntity> comforts ,
     @Default(FormzStatus.pure)FormzStatus status ,
     @Default(0) int  count ,
     @Default('') String next ,
 })=_FacilitiesState;
 }


