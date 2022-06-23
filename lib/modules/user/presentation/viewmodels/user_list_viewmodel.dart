import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

final userListViewModelProvider =
    MultiDataViewModelProvider<UserListViewModel, User>(
  (ref) => UserListViewModel(
    ref.read<UserRepository>(userRepositoryProvider),
  ),
);

const Pagination _pagination = Pagination();

class UserListViewModel extends MultiDataViewModel<User> {
  UserListViewModel(this._userRepository);
  final UserRepository _userRepository;

  @override
  Future<void> reload() {
    return loadData(() => _userRepository.getUsers(pagination: _pagination));
  }

  @override
  Future<void> loadMore() {
    return loadDataMore(
      (pagination) => _userRepository.getUsers(pagination: pagination),
    );
  }
}
