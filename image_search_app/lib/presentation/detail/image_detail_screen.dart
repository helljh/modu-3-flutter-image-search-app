import 'package:flutter/material.dart';

class ImageDetailScreen extends StatelessWidget {
  final int id;
  const ImageDetailScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    print(id);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 200,
              child: Image.network(''),
            ),
            SizedBox(height: 20),
            Text('user'),
            Text('tags'),
          ],
        ),
      ),
    );
  }
}
