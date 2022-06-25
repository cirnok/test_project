import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/infrastructure/infrastructure.dart';

class PostRepositoryImpl implements PostRepository {
  PostRepositoryImpl(this._client);
  final PostRestClient _client;

  @override
  Future<Either<Failure, List<Post>>> getPosts(
    int userId, {
    Pagination? pagination,
  }) {
    return _client
        .getPosts(
          userId,
          start: pagination?.start,
          limit: pagination?.limit,
        )
        .toEntity();
  }

  @override
  Future<Either<Failure, Post>> getPostById(int id) async {
    return _client.getPostById(id).toEntity();
  }
}
