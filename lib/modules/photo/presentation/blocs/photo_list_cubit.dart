import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/infrastructure/infrastructure.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

final photoListCubitProvider =
    BlocProvider.family<PhotoListCubit, DataState<List<Photo>>, int>(
  (ref, albumId) => PhotoListCubit(
    ref.read<PhotoRepository>(photoRepositoryProvider),
    albumId,
  ),
);

class PhotoListCubit extends Cubit<DataState<List<Photo>>> {
  final Pagination _pagination = const Pagination();

  PhotoListCubit(this._photoRepository, this.albumId)
      : super(const DataState.empty()) {
    reload();
  }

  final PhotoRepository _photoRepository;
  final int albumId;

  Future<void> reload() {
    return loadData(
      () => _photoRepository.getPhotos(albumId, pagination: _pagination),
      pagination: _pagination,
    );
  }

  Future<void> loadMore() {
    return loadDataMore(
      (pagination) =>
          _photoRepository.getPhotos(albumId, pagination: pagination),
    );
  }
}
