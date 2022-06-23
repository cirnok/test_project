import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/infrastructure/infrastructure.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

final albumViewModelProvider =
    SingleDataViewModelProviderWithModelValue<AlbumViewModel, Album>(
  (ref, value) => AlbumViewModel(
    value,
    ref.read<AlbumRepository>(albumRepositoryProvider),
  ),
);

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
