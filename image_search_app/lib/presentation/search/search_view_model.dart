import 'package:flutter/material.dart';
import 'package:image_search_app/domain/repository/repository.dart';
import 'package:image_search_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final ImageRepository _imageRepository;

  SearchState _state = SearchState();

  SearchViewModel({required ImageRepository imageRepository})
    : _imageRepository = imageRepository;

  SearchState get state => _state;

  Future<void> fetchImages() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final imageModels = await _imageRepository.getImages();
    _state = state.copyWith(imageModels: imageModels, isLoading: false);
    notifyListeners();
  }

  Future<void> getImagesByQuery(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final imageModels = await _imageRepository.getImagesByQuery(query);
    _state = state.copyWith(imageModels: imageModels, isLoading: false);
    notifyListeners();
  }
}
