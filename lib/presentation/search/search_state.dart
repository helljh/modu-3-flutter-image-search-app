import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  final List<ImageModel> imageModels;
  final bool isLoading;

  const SearchState({this.imageModels = const [], this.isLoading = false});
}
