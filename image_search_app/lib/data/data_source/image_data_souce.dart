import 'package:image_search_app/data/dto/hit_dto.dart';

abstract interface class ImageDataSouce {
  Future<List<HitDto>> getImages();

  Future<HitDto> getImageById(int id);

  Future<List<HitDto>> getImagesByQuery(String query);
}
