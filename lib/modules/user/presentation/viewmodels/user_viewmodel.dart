import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/infrastructure/infrastructure.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

final userViewModelProvider =
    SingleDataViewModelProviderWithModelValue<UserViewModel, User>(
  (ref, value) => UserViewModel(
    value,
    ref.read<UserRepository>(userRepositoryProvider),
  ),
);

class UserViewModel extends SingleDataViewModel<User> {
  UserViewModel(
    ModelValue<User> userValue,
    this._userRepository,
  ) : super(userValue);

  final UserRepository _userRepository;

  @override
  Future<void> reload() {
    return loadDataById((id) => _userRepository.getUserById(id));
  }
}
