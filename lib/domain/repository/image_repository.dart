import 'package:image_search_app/domain/model/model.dart';

abstract interface class ImageRepository {
  Future<List<ImageModel>> getImages();

  Future<ImageModel> getImageById(int id);

  Future<List<ImageModel>> getImagesByQuery(String query);
}
