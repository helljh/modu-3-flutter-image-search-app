import 'package:image_search_app/data/data_source/data_source.dart';
import 'package:image_search_app/data/mapper/image_mapper.dart';
import 'package:image_search_app/domain/model/image_model.dart';
import 'package:image_search_app/domain/repository/repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSouce _imageDataSouce;

  ImageRepositoryImpl({required ImageDataSouce imageDataSouce})
    : _imageDataSouce = imageDataSouce;

  @override
  Future<ImageModel> getImageById(int id) async {
    final response = await _imageDataSouce.getImageById(id);
    return response.toImage();
  }

  @override
  Future<List<ImageModel>> getImages() async {
    final response = await _imageDataSouce.getImages();
    return response.map((e) => e.toImage()).toList();
  }

  @override
  Future<List<ImageModel>> getImagesByQuery(String query) async {
    final response = await _imageDataSouce.getImagesByQuery(query);
    return response.map((e) => e.toImage()).toList();
  }
}
