import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class PhotoListViewModelProvider extends SPBlocProvider<PhotoListViewModel> {
  PhotoListViewModelProvider(
    int albumId, {
    super.key,
    super.child,
  }) : super(
          (_, sp) => PhotoListViewModel(
            sp.getRequired<PhotoRepository>(),
            albumId,
          ),
        );
}

const Pagination _pagination = Pagination();

class PhotoListViewModel extends MultiDataViewModel<Photo> {
  PhotoListViewModel(
    this._photoRepository,
    this.albumId,
  );

  final PhotoRepository _photoRepository;
  final int albumId;

  @override
  Future<void> reload() {
    return loadData(
      () => _photoRepository.getPhotos(albumId, pagination: _pagination),
    );
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) =>
          _photoRepository.getPhotos(albumId, pagination: pagination),
    );
  }
}
