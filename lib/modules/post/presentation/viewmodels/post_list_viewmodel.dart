import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

class PostListViewModelProvider extends SPBlocProvider<PostListViewModel> {
  PostListViewModelProvider(
    int userId, {
    super.key,
    super.child,
  }) : super(
          (_, sp) => PostListViewModel(
            sp.getRequired<PostRepository>(),
            userId,
          ),
        );
}

const Pagination _pagination = Pagination();

class PostListViewModel extends MultiDataViewModel<Post> {
  PostListViewModel(
    this._postRepository,
    this.userId,
  );

  final PostRepository _postRepository;
  final int userId;

  @override
  Future<void> reload() {
    return loadData(
      () => _postRepository.getPosts(userId, pagination: _pagination),
    );
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) => _postRepository.getPosts(userId, pagination: pagination),
    );
  }
}
