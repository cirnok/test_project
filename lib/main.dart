import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/modules/photo/infrastructure/infrastructure.dart';
import 'package:test_project/modules/post/infrastructure/infrastructure.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';

import 'main.dino.g.dart';

Future<void> main() async {
  runApp(const ApplicationPlaceholder());

  final rootScope = await createServiceScope();

  runApp(
    Provider(
      create: (_) => rootScope.serviceProvider,
      child: Application(),
    ),
  );
}

Future<ServiceScope> createServiceScope() async {
  final ServiceCollection services = $ServiceCollection();

  services.addSingleton<DioProvider>();
  services.addSingletonFactory(createDio);

  services.addSingleton<UserRestClient>();
  services.addSingleton<UserRepositoryImpl>();

  services.addSingleton<AlbumRestClient>();
  services.addSingleton<AlbumRepositoryImpl>();

  services.addSingleton<PhotoRestClient>();
  services.addSingleton<PhotoRepositoryImpl>();

  services.addSingleton<CommentRestClient>();
  services.addSingleton<CommentRepositoryImpl>();

  services.addSingleton<PostRestClient>();
  services.addSingleton<PostRepositoryImpl>();

  final rootScope = services.buildRootScope();
  await rootScope.initialize();

  return rootScope;
}
