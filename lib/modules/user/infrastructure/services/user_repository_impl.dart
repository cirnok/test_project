import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._client);
  final UserRestClient _client;

  @override
  Future<Either<Failure, List<User>>> getUsers() {
    return _client.getUsers().toEntity();
  }

  @override
  Future<Either<Failure, User>> getUserById(int id) async {
    return _client.getUserById(id).toEntity();
  }
}
