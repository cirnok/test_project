// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    UserListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const UserListPage());
    },
    UserRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<UserRouteArgs>(
          orElse: () => UserRouteArgs(userId: pathParams.getInt('id')));
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: UserPage(args.userId, key: args.key, user: args.user));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(UserListRoute.name, path: '/'),
        RouteConfig(UserRoute.name, path: '/user/:id')
      ];
}

/// generated route for
/// [UserListPage]
class UserListRoute extends PageRouteInfo<void> {
  const UserListRoute() : super(UserListRoute.name, path: '/');

  static const String name = 'UserListRoute';
}

/// generated route for
/// [UserPage]
class UserRoute extends PageRouteInfo<UserRouteArgs> {
  UserRoute({required int userId, Key? key, User? user})
      : super(UserRoute.name,
            path: '/user/:id',
            args: UserRouteArgs(userId: userId, key: key, user: user),
            rawPathParams: {'id': userId});

  static const String name = 'UserRoute';
}

class UserRouteArgs {
  const UserRouteArgs({required this.userId, this.key, this.user});

  final int userId;

  final Key? key;

  final User? user;

  @override
  String toString() {
    return 'UserRouteArgs{userId: $userId, key: $key, user: $user}';
  }
}
