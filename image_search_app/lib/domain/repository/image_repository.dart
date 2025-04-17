import 'package:image_search_app/domain/model/model.dart';

abstract interface class ImageRepository {
  Future<List<ImageModel>> getImages();

  Future<ImageModel> getImage(int id);
}
