// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:test_project/core/domain/domain.dart';
import 'package:test_project/core/presentation/presentation.dart';

extension DataHelpers<T> on Either<Failure, T> {
  DataState<T> toState(DataState<T> oldState) {
    return fold(
      (l) {
        if (oldState is DataStateLoading<T>) {
          return DataState<T>.loading(data: oldState.data);
        } else if (oldState is DataStateSlientLoading<T>) {
          return DataState<T>.slientLoading(data: oldState.data);
        } else if (oldState is DataStateLoaded<T>) {
          return DataState<T>.loaded(data: oldState.data, failure: l);
        } else {
          return DataState<T>.empty(failure: l);
        }
      },
      (r) => DataState<T>.loaded(data: r),
    );
  }
}

extension DataCubitHelpers<T> on Cubit<DataState<T>> {
  Future<void> loadData(
    Future<Either<Failure, T>> Function() method, {
    void Function(Failure failure)? onFailure,
  }) async {
    final oldState = state;

    emit(const DataState.loading());

    final response = await method();
    emit(response.toState(oldState));

    if (response.isLeft() && onFailure != null) {
      final failure = response.getLeft().toNullable()!;
      onFailure(failure);
    }
  }
}
