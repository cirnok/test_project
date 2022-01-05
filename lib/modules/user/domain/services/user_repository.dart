import 'package:test_project/modules/user/domain/domain.dart';

abstract class UserRepository {
  Future<Either<Failure, List<User>>> getUsers({Pagination? pagination});
  Future<Either<Failure, User>> getUserById(int id);
}
