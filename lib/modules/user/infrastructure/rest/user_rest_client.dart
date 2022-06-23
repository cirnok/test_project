import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';

part 'user_rest_client.g.dart';

@RestApi(baseUrl: CoreInfrastructureConstants.apiUrl)
abstract class UserRestClient {
  factory UserRestClient(Dio dio) = _UserRestClient;

  @GET('/users')
  Future<List<User>> getUsers({
    @Query("_start") int? start,
    @Query("_limit") int? limit,
  });

  @GET('/users/{id}')
  Future<User> getUserById(@Path("id") int id);
}
