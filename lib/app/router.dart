import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';
import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

part 'router.gr.dart';

@CustomAutoRouter(
  replaceInRouteName: 'Page,Route',
  transitionsBuilder: RouteTransition.animation,
  durationInMilliseconds: 500,
  reverseDurationInMilliseconds: 500,
  routes: <AutoRoute>[
    AutoRoute(
      page: UserListPage,
      path: '/users',
      initial: true,
    ),
    AutoRoute(
      page: UserPage,
      path: '/users/:userId',
    ),
    AutoRoute(
      page: AlbumListPage,
      path: '/users/:userId/albums',
    ),
    AutoRoute(
      page: AlbumPage,
      path: '/users/:userId/albums/:albumId',
    ),
  ],
)
class AppRouter extends _$AppRouter {}
