import 'package:flutter/material.dart';
import 'package:image_search_app/core/component/grid_image_container.dart';
import 'package:image_search_app/domain/model/image_model.dart';
import 'package:image_search_app/presentation/search/search_view_model.dart';
import 'package:image_search_app/ui/color_styles.dart';

class SearchScreen extends StatefulWidget {
  final SearchViewModel viewModel;
  const SearchScreen({super.key, required this.viewModel});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<ImageModel> images;
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchImages();
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
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),

                  TextField(
                    style: TextStyle(color: ColorStyles.textColor),
                    onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search_rounded),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black38),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: ColorStyles.primaryColor),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                      ),
                      itemBuilder: (context, index) {
                        return GridImageContainer(
                          model: widget.viewModel.state.imageModels[index],
                        );
                      },
                      itemCount: widget.viewModel.state.imageModels.length,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
