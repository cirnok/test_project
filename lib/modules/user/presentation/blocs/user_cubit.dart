import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

final userCubitProvider = BlocProvider.family<UserCubit, DataState<User>, int>(
  (ref, userId) => UserCubit(
    ref.read<UserRepository>(userRepositoryProvider),
    userId,
  ),
);

class UserCubit extends Cubit<DataState<User>> {
  UserCubit(
    this._userRepository,
    int userId, [
    User? user,
  ]) : super(const DataState.empty()) {
    if (user != null) {
      _fromMemory(user);
    } else {
      _getById(userId);
    }
  }

  final UserRepository _userRepository;

  Future<void> _getById(int id) async {
    return loadData(
      () => _userRepository.getUserById(id),
    );
  }

  Future<void> _fromMemory(User user) {
    emit(DataState.loaded(data: user));
    return slientLoadData(
      () => _userRepository.getUserById(user.id),
    );
  }
}
