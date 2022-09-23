part of 'specialization_bloc.dart';


@Freezed()
 class SpecializationEvent with _$SpecializationEvent {
   factory SpecializationEvent.getSpecs()=_GetSpecs;
   factory SpecializationEvent.getMoreSpecs()=_GetMoreSpecs;
   factory SpecializationEvent.selectSpec(int id)=_SelectSpec;


 }
