import 'package:image_search_app/data/dto/hit_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_response_dto.g.dart';

@JsonSerializable()
class ImageResponseDto {
  final num? total;
  final num? totalHits;
  final List<HitDto> hits;

  const ImageResponseDto({this.total, this.totalHits, required this.hits});

  factory ImageResponseDto.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ImageResponseDtoToJson(this);
}
