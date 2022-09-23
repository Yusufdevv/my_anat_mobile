import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'purchased_journal.g.dart';


@JsonSerializable()
class PurchasedJournal {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'slug')
  final String slug;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'image')
  final ImageModel image;
  @JsonKey(name: 'category')
  final TitlerModel category;
  @JsonKey(name: 'organization')
  final int organization;
  @JsonKey(name: 'redaction')
  final String redaction;
  @JsonKey(name: 'is_premium')
  final bool isPremium;
  @JsonKey(name: 'price')
  final String price;
  @JsonKey(name: 'publish_date')
  final String publishDate;
  @JsonKey(name: 'tags')
  final List<TitlerModel> tags;
  @JsonKey(name: 'is_bought')
  final bool isBought;

  PurchasedJournal(
      { this.redaction='',
       this.isPremium=false,
       this.category=const TitlerModel(title: '',id: 0),
       this.publishDate='',
       this.id=0,
       this.name='',
       this.price='',
       this.image=const ImageModel(origin: '', small: '', middle: '', id: 0),
       this.description='',
       this.slug='',
       this.isBought=false,
       this.organization=0,
       this.tags=const []});

  factory PurchasedJournal.fromJson(Map<String,dynamic> json)=>_$PurchasedJournalFromJson(json);
}

