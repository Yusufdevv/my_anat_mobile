import 'package:anatomica/features/auth/data/models/image_model.dart';
import 'package:anatomica/features/common/data/models/titler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'purchased_article.g.dart';

@JsonSerializable()
class PurchasedArticle {

  @JsonKey(name: 'id',defaultValue: 0)
  final int id;
  @JsonKey(name: 'title',defaultValue: '')
  final String title;
  @JsonKey(name: 'is_paid_for_publish',defaultValue: false)
  final bool paidForPublish;
  @JsonKey(name: 'moderation_status',defaultValue: '')
  final String moderizationStatus;
  @JsonKey(name: 'slug',defaultValue: '')
  final String slug;
  @JsonKey(name: 'images',defaultValue: [])
  final List<ImageModel> images;
  @JsonKey(name: 'publish_date',defaultValue: '')
  final String publishDate;
  @JsonKey(name: 'category',)
  final TitlerModel category;
  @JsonKey(name: 'is_premium',defaultValue: false)
  final bool isPremium;
  @JsonKey(name: 'redaction',defaultValue: '')
  final String redaction;
  @JsonKey(name: 'view_count',defaultValue: 0)
  final int viewCount;

  PurchasedArticle(
      {required this.id,
      required this.title,
      required this.images,
      required this.slug,
      required this.publishDate,
       this.category=const TitlerModel(title: '',id: -1),
      required this.isPremium,
      required this.moderizationStatus,
      required this.paidForPublish,
      required this.redaction,
      required this.viewCount});

  factory PurchasedArticle.fromJson(Map<String,dynamic> json)=>_$PurchasedArticleFromJson(json);
}
