import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class AlbumListViewModelProvider extends SPBlocProvider<AlbumListViewModel> {
  AlbumListViewModelProvider(
    int userId, {
    super.key,
    super.child,
  }) : super(
          (_, sp) => AlbumListViewModel(
            sp.getRequired<AlbumRepository>(),
            userId,
          ),
        );
}

const Pagination _pagination = Pagination();

class AlbumListViewModel extends MultiDataViewModel<Album> {
  AlbumListViewModel(
    this._albumRepository,
    this.userId,
  );

  final AlbumRepository _albumRepository;
  final int userId;

  @override
  Future<void> reload() {
    return loadData(
      () => _albumRepository.getAlbums(userId, pagination: _pagination),
    );
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) =>
          _albumRepository.getAlbums(userId, pagination: pagination),
    );
  }
}
