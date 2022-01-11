import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/infrastructure/infrastructure.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

final postListCubitProvider =
    BlocProvider.family<PostListCubit, DataState<List<Post>>, int>(
  (ref, userId) => PostListCubit(
    ref.read<PostRepository>(postRepositoryProvider),
    userId,
  ),
);

class PostListCubit extends Cubit<DataState<List<Post>>> {
  final Pagination _pagination = const Pagination();

  PostListCubit(this._postRepository, this.userId)
      : super(const DataState.empty()) {
    reload();
  }

  final PostRepository _postRepository;
  final int userId;

  Future<void> reload() {
    return loadData(
      () => _postRepository.getPosts(userId, pagination: _pagination),
      pagination: _pagination,
    );
  }

  Future<void> loadMore() {
    return loadDataMore(
      (pagination) =>
          _postRepository.getPosts(userId, pagination: pagination),
    );
  }
}
