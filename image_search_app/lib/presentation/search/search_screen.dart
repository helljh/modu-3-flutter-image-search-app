import 'package:flutter/material.dart';
import 'package:image_search_app/core/component/grid_image_container.dart';
import 'package:image_search_app/ui/color_styles.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
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
                    return GridImageContainer();
                  },
                  itemCount: 10,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
