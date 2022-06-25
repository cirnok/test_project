import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

class UserViewModelProvider extends SPBlocProvider<UserViewModel> {
  UserViewModelProvider(
    ModelValue<User> userValue, {
    super.key,
    super.child,
  }) : super(
          (_, sp) => UserViewModel(
            sp.getRequired<UserRepository>(),
            userValue,
          ),
        );
}

class UserViewModel extends SingleDataViewModel<User> {
  UserViewModel(
    this._userRepository,
    ModelValue<User> userValue,
  ) : super(userValue);

  final UserRepository _userRepository;

  @override
  Future<void> reload() {
    return loadDataById((id) => _userRepository.getUserById(id));
  }
}
