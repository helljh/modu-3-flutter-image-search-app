import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_model.freezed.dart';

@freezed
class ImageModel with _$ImageModel {
  @override
  final int id;
  @override
  final int userId;
  @override
  final String user;
  @override
  final String imageUrl;
  @override
  final String tags;

  const ImageModel({
    required this.id,
    required this.userId,
    required this.user,
    required this.imageUrl,
    required this.tags,
  });
}
