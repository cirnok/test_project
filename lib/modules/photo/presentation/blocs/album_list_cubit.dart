import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/infrastructure/infrastructure.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

final albumListCubitProvider =
    BlocProvider.family<AlbumListCubit, DataState<List<Album>>, int>(
  (ref, userId) => AlbumListCubit(
    ref.read<AlbumRepository>(albumRepositoryProvider),
    userId,
  ),
);

class AlbumListCubit extends Cubit<DataState<List<Album>>> {
  final Pagination _pagination = const Pagination();

  AlbumListCubit(this._albumRepository, this.userId)
      : super(const DataState.empty()) {
    reload();
  }

  final AlbumRepository _albumRepository;
  final int userId;

  Future<void> reload() {
    return loadData(
      () => _albumRepository.getAlbums(userId, pagination: _pagination),
      pagination: _pagination,
    );
  }

  Future<void> loadMore() {
    return loadDataMore(
      (pagination) =>
          _albumRepository.getAlbums(userId, pagination: pagination),
    );
  }
}
