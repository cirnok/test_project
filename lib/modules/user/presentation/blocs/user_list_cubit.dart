import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserListCubit extends Cubit<DataState<List<User>>> {
  UserListCubit(this._repository) : super(const DataState.empty()) {
    _getUsers();
  }

  final UserRepository _repository;

  Future<void> _getUsers() {
    return loadData(
      () => _repository.getUsers(),
    );
  }
}
