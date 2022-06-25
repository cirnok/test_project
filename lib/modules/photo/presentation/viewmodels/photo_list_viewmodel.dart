import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

MultiDataViewModelProvider<Photo, PhotoListViewModel>
    createPhotoListViewModelProvider(int albumId) {
  return MultiDataViewModelProvider<Photo, PhotoListViewModel>(
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
