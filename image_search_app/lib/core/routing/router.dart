import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/data/data_source/data_source.dart';
import 'package:image_search_app/data/repository/repository.dart';
import 'package:image_search_app/presentation/search/search_screen.dart';
import 'package:image_search_app/presentation/search/search_view_model.dart';

final router = GoRouter(
  initialLocation: Routes.search,
  routes: [
    GoRoute(
      path: Routes.search,
      builder:
          (context, state) => SearchScreen(
            viewModel: SearchViewModel(
              imageRepository: ImageRepositoryImpl(
                imageDataSouce: ImageDataSourceImpl(),
              ),
            ),
          ),
    ),
  ],
);
