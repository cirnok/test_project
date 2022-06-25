import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

class AlbumViewModelProvider extends SPBlocProvider<AlbumViewModel> {
  AlbumViewModelProvider(
    ModelValue<Album> albumValue, {
    super.key,
    super.child,
  }) : super(
          (_, sp) => AlbumViewModel(
            sp.getRequired<AlbumRepository>(),
            albumValue,
          ),
        );
}

class AlbumViewModel extends SingleDataViewModel<Album> {
  AlbumViewModel(
    this._albumRepository,
    ModelValue<Album> albumValue,
  ) : super(albumValue);

  final AlbumRepository _albumRepository;

  @override
  Future<void> reload() {
    return loadDataById((id) => _albumRepository.getAlbumById(id));
  }
}
