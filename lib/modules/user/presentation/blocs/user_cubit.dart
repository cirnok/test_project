import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserCubit extends Cubit<DataState<User>> {
  UserCubit(
    this._repository,
    int userId, [
    User? user,
  ]) : super(const DataState.empty()) {
    if (user != null) {
      _fromCache(user);
    } else {
      _getById(userId);
    }
  }

  final UserRepository _repository;

  Future<void> _getById(int id) async {
    return loadData(
      () => _repository.getUserById(id),
    );
  }

  void _fromCache(User user) => emit(DataState.loaded(data: user));
}
