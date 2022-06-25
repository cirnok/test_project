import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

MultiDataViewModelProvider<Comment, CommentListViewModel>
    createCommentListViewModelProvider(int postId) {
  return MultiDataViewModelProvider<Comment, CommentListViewModel>(
    (_, sp) => CommentListViewModel(
      sp.getRequired<CommentRepository>(),
      postId,
    ),
  );
}

const Pagination _pagination = Pagination();

class CommentListViewModel extends MultiDataViewModel<Comment> {
  CommentListViewModel(
    this._commentRepository,
    this.postId,
  );

  final CommentRepository _commentRepository;
  final int postId;

  @override
  Future<void> reload() {
    return loadData(
      () => _commentRepository.getComments(postId, pagination: _pagination),
    );
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) =>
          _commentRepository.getComments(postId, pagination: pagination),
    );
  }

  void addCommentFromMemory(Comment comment) {
    assert(state is DataStateLoaded);

    emit(DataState.loaded(
      data: [comment, ...state.data!],
    ));
  }
}
