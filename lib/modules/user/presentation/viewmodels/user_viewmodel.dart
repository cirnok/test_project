import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

SingleDataViewModelProvider<User, UserViewModel> createUserViewModelProvider(
  ModelValue<User> value,
) {
  return SingleDataViewModelProvider<User, UserViewModel>(
    (_, sp) => UserViewModel(
      value,
      sp.getRequired<UserRepository>(),
    ),
  );
}

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
