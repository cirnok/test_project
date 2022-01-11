import 'package:test_project/modules/post/domain/domain.dart';
import 'package:test_project/modules/post/infrastructure/infrastructure.dart';
import 'package:test_project/modules/post/presentation/presentation.dart';

final commentListCubitProvider =
    BlocProvider.family<CommentListCubit, DataState<List<Comment>>, int>(
  (ref, postId) => CommentListCubit(
    ref.read<CommentRepository>(commentRepositoryProvider),
    postId,
  ),
);

class CommentListCubit extends Cubit<DataState<List<Comment>>> {
  final Pagination _pagination = const Pagination();

  CommentListCubit(this._commentRepository, this.postId)
      : super(const DataState.empty()) {
    reload();
  }

  final CommentRepository _commentRepository;
  final int postId;

  Future<void> reload() {
    return loadData(
      () => _commentRepository.getComments(postId, pagination: _pagination),
      pagination: _pagination,
    );
  }

  Future<void> loadMore() {
    return loadDataMore(
      (pagination) =>
          _commentRepository.getComments(postId, pagination: pagination),
    );
  }

  void addCommentFromMemory(Comment comment) {
    if (state is DataStateLoaded) {
      emit(
        DataState<List<Comment>>.loaded(
          data: [comment] + (state as DataStateLoaded<List<Comment>>).data,
        ),
      );
    }
  }
}
