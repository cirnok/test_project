import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

part 'router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: UserListPage,
      path: '/',
      initial: true,
    ),
    AutoRoute(
      page: UserPage,
      path: '/user/:id',
    ),
  ],
)
class AppRouter extends _$AppRouter {}
