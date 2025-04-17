import 'package:flutter/material.dart';
import 'package:image_search_app/domain/model/model.dart';

class GridImageContainer extends StatelessWidget {
  final ImageModel model;
  const GridImageContainer({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.network(model.imageUrl, fit: BoxFit.cover),
    );
  }
}
