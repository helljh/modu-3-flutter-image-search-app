import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_search_app/data/data_source/data_source.dart';
import 'package:image_search_app/data/dto/hit_dto.dart';

import 'package:http/http.dart' as http;

class ImageDataSourceImpl implements ImageDataSouce {
  String get _apiKey => dotenv.env['API_KEY'] ?? '';
  String get _baseUrl => 'https://pixabay.com/api/?key=$_apiKey';

  @override
  Future<HitDto> getImageById(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl&id=$id'));

    if (response.statusCode == 200) {
      final List decodedData = jsonDecode(response.body)['hits'];

      return decodedData
          .map((e) => e as Map<String, dynamic>)
          .toList()
          .map((e) => HitDto.fromJson(e))
          .toList()
          .first;
    } else {
      return HitDto();
    }
  }

  @override
  Future<List<HitDto>> getImages() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List decodeData = jsonDecode(response.body)['hits'];
      return decodeData
          .map((e) => e as Map<String, dynamic>)
          .toList()
          .map((e) => HitDto.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }

  @override
  Future<List<HitDto>> getImagesByQuery(String query) async {
    final response = await http.get(Uri.parse('$_baseUrl&q=$query'));

    if (response.statusCode == 200) {
      final List decodedData = jsonDecode(response.body)['hits'];

      return decodedData
          .map((e) => e as Map<String, dynamic>)
          .toList()
          .map((e) => HitDto.fromJson(e))
          .toList();
    } else {
      return [];
    }
  }
}
