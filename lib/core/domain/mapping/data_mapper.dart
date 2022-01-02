import 'package:test_project/core/domain/domain.dart';

extension DataMapper<T> on Future<T> {
  Future<Either<Failure, T>> toEntity() async {
    try {
      return Right(await this);
    } catch (e) {
      //TODO
      return Left(ServerFailure());
    }
  }
}
