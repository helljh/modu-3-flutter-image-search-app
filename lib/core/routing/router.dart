import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/data/data_source/data_source.dart';
import 'package:image_search_app/data/repository/repository.dart';
import 'package:image_search_app/presentation/detail/image_detail_screen.dart';
import 'package:image_search_app/presentation/detail/image_detail_view_model.dart';
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
    GoRoute(
      path: Routes.detail,
      builder: (context, state) {
        final id = state.pathParameters['id'];
        return ImageDetailScreen(
          id: int.parse(id!),
          viewModel: ImageDetailViewModel(
            imageRepository: ImageRepositoryImpl(
              imageDataSouce: ImageDataSourceImpl(),
            ),
          ),
        );
      },
    ),
  ],
);
