import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl(this._client);
  final UserRestClient _client;

  @override
  Future<Either<Failure, List<User>>> getUsers({Pagination? pagination}) {
    return _client
        .getUsers(
          start: pagination?.start,
          limit: pagination?.limit,
        )
        .toEntity();
  }

  @override
  Future<Either<Failure, User>> getUserById(int id) async {
    return _client.getUserById(id).toEntity();
  }
}
