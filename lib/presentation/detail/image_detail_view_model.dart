import 'package:flutter/material.dart';
import 'package:image_search_app/domain/repository/repository.dart';
import 'package:image_search_app/presentation/detail/image_detail_state.dart';

class ImageDetailViewModel with ChangeNotifier {
  final ImageRepository _imageRepository;

  ImageDetailState _state = ImageDetailState();

  ImageDetailViewModel({required ImageRepository imageRepository})
    : _imageRepository = imageRepository;

  ImageDetailState get state => _state;

  Future<void> fetchImageModel(int id) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final imageModel = await _imageRepository.getImageById(id);
    _state = state.copyWith(model: imageModel, isLoading: false);
    notifyListeners();
  }
}
