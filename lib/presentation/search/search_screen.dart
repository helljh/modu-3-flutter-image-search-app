import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchImages();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
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

            final images = widget.viewModel.state.imageModels;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 20),

                  TextField(
                    controller: controller,
                    style: TextStyle(color: ColorStyles.textColor),
                    onTapUpOutside: (event) => FocusScope.of(context).unfocus(),
                    decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                        onTap: () {
                          widget.viewModel.getImagesByQuery(controller.text);
                        },
                        child: Icon(Icons.search_rounded),
                      ),

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
                        return GestureDetector(
                          onTap:
                              () => context.push('/detail/${images[index].id}'),
                          child: GridImageContainer(model: images[index]),
                        );
                      },
                      itemCount: images.length,
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
