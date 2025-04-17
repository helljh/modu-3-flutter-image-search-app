import 'package:image_search_app/data/dto/hit_dto.dart';
import 'package:image_search_app/domain/model/model.dart';

extension ImageMapper on HitDto {
  ImageModel toImage() {
    return ImageModel(
      id: id != null ? id!.toInt() : 0,
      userId: userId != null ? userId!.toInt() : 0,
      user: user ?? '',
      imageUrl: previewURL ?? '',
      tags: tags ?? '',
    );
  }
}
