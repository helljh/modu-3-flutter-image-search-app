import 'package:go_router/go_router.dart';
import 'package:image_search_app/core/routing/routes.dart';
import 'package:image_search_app/presentation/search/search_screen.dart';

final router = GoRouter(
  initialLocation: Routes.search,
  routes: [
    GoRoute(path: Routes.search, builder: (context, state) => SearchScreen()),
  ],
);
