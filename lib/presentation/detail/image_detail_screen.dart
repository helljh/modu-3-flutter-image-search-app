import 'package:flutter/material.dart';
import 'package:image_search_app/presentation/detail/image_detail_view_model.dart';

class ImageDetailScreen extends StatefulWidget {
  final int id;
  final ImageDetailViewModel viewModel;
  const ImageDetailScreen({
    super.key,
    required this.id,
    required this.viewModel,
  });

  @override
  State<ImageDetailScreen> createState() => _ImageDetailScreenState();
}

class _ImageDetailScreenState extends State<ImageDetailScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchImageModel(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewModel,
          builder: (context, snapshot) {
            if (widget.viewModel.state.isLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (widget.viewModel.state.model == null) {
              return Center(child: Text('해당 데이터가 없습니다'));
            }

            final model = widget.viewModel.state.model!;

            return Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  height: 428,
                  child: Image.network(model.largeImageUrl, fit: BoxFit.cover),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('user : ${model.user}'),
                      SizedBox(height: 10),
                      Text('tags : ${model.tags}', maxLines: 2),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
