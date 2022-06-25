import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_project/core/infrastructure/infrastructure.dart';

class DioProvider implements Initializable {
  final dio = Dio();

  @override
  Future initialize() async {
    final path = (await getApplicationDocumentsDirectory()).path;

    final options = CacheOptions(
      store: HiveCacheStore(path),
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 2),
      priority: CachePriority.high,
    );

    dio.interceptors.add(DioCacheInterceptor(options: options));
  }
}

Dio createDio(ServiceProvider sp) {
  return sp.getRequired<DioProvider>().dio;
}
