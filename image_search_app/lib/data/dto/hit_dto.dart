import 'package:json_annotation/json_annotation.dart';

part 'hit_dto.g.dart';

@JsonSerializable()
class HitDto {
  final num? id;
  final String? pageUrl;
  final String? type;
  final String? tags;
  final String? previewUrl;
  final num? previewWidth;
  final num? previewHeight;
  final String? webformatUrl;
  final num? webformatWidth;
  final num? webformatHeight;
  final String? largeImageUrl;
  final num? imageWidth;
  final num? imageHeight;
  final num? imageSize;
  final num? views;
  final num? downloads;
  final num? collections;
  final num? likes;
  final num? comments;
  final num? userId;
  final String? user;
  final String? userImageUrl;

  const HitDto({
    this.id,
    this.pageUrl,
    this.type,
    this.tags,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.webformatUrl,
    this.webformatWidth,
    this.webformatHeight,
    this.largeImageUrl,
    this.imageWidth,
    this.imageHeight,
    this.imageSize,
    this.views,
    this.downloads,
    this.collections,
    this.likes,
    this.comments,
    this.userId,
    this.user,
    this.userImageUrl,
  });

  factory HitDto.fromJson(Map<String, dynamic> json) => _$HitDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HitDtoToJson(this);
}
