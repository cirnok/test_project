import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

final userListCubitProvider =
    BlocProvider<UserListCubit, DataState<List<User>>>(
  (ref) => UserListCubit(
    ref.read<UserRepository>(userRepositoryProvider),
  ),
);

class UserListCubit extends Cubit<DataState<List<User>>> {
  final Pagination _pagination = const Pagination();

  UserListCubit(this._userRepository) : super(const DataState.empty()) {
    reload();
  }

  final UserRepository _userRepository;

  Future<void> reload() {
    return loadData(
      () => _userRepository.getUsers(pagination: _pagination),
      pagination: _pagination,
    );
  }

  Future<void> loadMore() {
    if (state is DataStateLoaded) {
      return loadDataMore(
        (pagination) => _userRepository.getUsers(pagination: pagination),
      );
    }

    return Future(() => null);
  }
}
