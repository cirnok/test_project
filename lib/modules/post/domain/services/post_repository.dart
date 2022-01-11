import 'package:test_project/modules/post/domain/domain.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getPosts(
    int userId, {
    Pagination? pagination,
  });
  Future<Either<Failure, Post>> getPostById(int id);
}
