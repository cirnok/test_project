import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

SingleDataViewModelProvider<Album, AlbumViewModel> createAlbumViewModelProvider(
  ModelValue<Album> value,
) {
  return SingleDataViewModelProvider<Album, AlbumViewModel>(
    (_, sp) => AlbumViewModel(
      value,
      sp.getRequired<AlbumRepository>(),
    ),
  );
}

class AlbumViewModel extends SingleDataViewModel<Album> {
  AlbumViewModel(
    ModelValue<Album> albumValue,
    this._albumRepository,
  ) : super(albumValue);

  final AlbumRepository _albumRepository;

  @override
  Future<void> reload() {
    return loadDataById((id) => _albumRepository.getAlbumById(id));
  }
}
