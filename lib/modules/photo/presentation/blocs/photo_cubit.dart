import 'package:test_project/modules/photo/domain/domain.dart';
import 'package:test_project/modules/photo/infrastructure/infrastructure.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';

final photoCubitProvider =
    BlocProvider.family<PhotoCubit, DataState<Photo>, dynamic>(
  (ref, photo) {
    assert(photo is int || photo is Photo);

    return PhotoCubit(
      ref.read<PhotoRepository>(photoRepositoryProvider),
      photo is Photo ? photo.id : photo,
      photo is Photo ? photo : null,
    );
  },
);

class PhotoCubit extends Cubit<DataState<Photo>> {
  PhotoCubit(
    this._photoRepository,
    int photoId, [
    Photo? photo,
  ]) : super(const DataState.empty()) {
    if (photo != null) {
      _fromMemory(photo);
    } else {
      _getById(photoId);
    }
  }

  final PhotoRepository _photoRepository;

  Future<void> _getById(int id) async {
    return loadData(
      () => _photoRepository.getPhotoById(id),
    );
  }

  Future<void> _fromMemory(Photo photo) {
    emit(DataState.loaded(data: photo));
    return slientLoadData(
      () => _photoRepository.getPhotoById(photo.id),
    );
  }
}
