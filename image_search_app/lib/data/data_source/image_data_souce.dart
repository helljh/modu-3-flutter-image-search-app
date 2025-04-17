import 'package:image_search_app/data/dto/hit_dto.dart';

abstract interface class ImageDataSouce {
  Future<List<HitDto>> getImages();

  Future<HitDto> getImage(int id);
}
