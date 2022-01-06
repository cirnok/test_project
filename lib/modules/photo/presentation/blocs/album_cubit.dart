import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/infrastructure/infrastructure.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

final albumCubitProvider =
    BlocProvider.family<AlbumCubit, DataState<Album>, dynamic>(
  (ref, album) {
    assert(album is int || album is Album);

    return AlbumCubit(
      ref.read<AlbumRepository>(albumRepositoryProvider),
      album is Album ? album.id : album,
      album is Album ? album : null,
    );
  },
);

class AlbumCubit extends Cubit<DataState<Album>> {
  AlbumCubit(
    this._albumRepository,
    int albumId, [
    Album? album,
  ]) : super(const DataState.empty()) {
    if (album != null) {
      _fromMemory(album);
    } else {
      _getById(albumId);
    }
  }

  final AlbumRepository _albumRepository;

  Future<void> _getById(int id) async {
    return loadData(
      () => _albumRepository.getAlbumById(id),
    );
  }

  Future<void> _fromMemory(Album album) {
    emit(DataState.loaded(data: album));
    return slientLoadData(
      () => _albumRepository.getAlbumById(album.id),
    );
  }
}
