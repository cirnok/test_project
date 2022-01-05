import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:test_project/core/domain/domain.dart';
import 'package:test_project/core/infrastructure/infrastructure.dart';

final dioProvider = Provider(
  (ref) {
    final dio = Dio();
    final path = ref.read(pathProvider);

    final options = CacheOptions(
      store: HiveCacheStore(path),
      policy: CachePolicy.request,
      hitCacheOnErrorExcept: [401, 403],
      maxStale: const Duration(days: 2),
      priority: CachePriority.high,
      cipher: null,
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      allowPostMethod: false,
    );

    dio.interceptors.add(DioCacheInterceptor(options: options));
    return dio;
  },
);
