import 'package:test_project/constants.dart';
import 'package:test_project/modules/user/domain/domain.dart';

part 'user_rest_client.g.dart';

@RestApi(baseUrl: AppConstants.apiUrl)
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
