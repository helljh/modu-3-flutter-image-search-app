import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_search_app/domain/model/image_model.dart';

part 'image_detail_state.freezed.dart';

@freezed
class ImageDetailState with _$ImageDetailState {
  @override
  final ImageModel? model;
  @override
  final bool isLoading;

  const ImageDetailState({this.model, this.isLoading = false});
}
