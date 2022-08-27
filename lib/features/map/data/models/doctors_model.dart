import 'package:anatomica/features/common/models/logo.dart';
import 'package:anatomica/features/map/domain/entities/doctor_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'doctors_model.g.dart';

@JsonSerializable()
class DoctorsModel extends DoctorsEntity {
  @JsonKey(name: 'id',defaultValue: 0)
  final int id;
  @JsonKey(name: 'full_name',defaultValue: '')
  final String fullName;
  @JsonKey(name: 'image',)
  final AssetModel? photo;
  @JsonKey(name: 'position',defaultValue: '')
  final String position;
  @JsonKey(name: 'address',defaultValue: '')
  final String address;
  @JsonKey(name: 'rating',defaultValue: 0)
  final double rating;
  @JsonKey(name: 'lat',defaultValue: 0)
  final double lat;
  @JsonKey(name: 'long',defaultValue: 0)
  final double long;
  @JsonKey(name: 'specialization',defaultValue: '')
  final String specialization;

  DoctorsModel(
      {required this.photo,
      required this.id,
      required this.specialization,
      required this.rating,
      required this.address,
      required this.position,
      required this.long,
      required this.lat,
      required this.fullName}):super(id: id,image: photo??AssetModel(small: '', middle: '', origin: ''),name: fullName,lat: 0,long: 0,rating: rating,specialization: specialization);

  factory DoctorsModel.fromJson(Map<String,dynamic> json)=>_$DoctorsModelFromJson(json);
}
