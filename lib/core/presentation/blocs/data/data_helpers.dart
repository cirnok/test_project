// ignore_for_file: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member

import 'package:test_project/core/domain/domain.dart';
import 'package:test_project/core/presentation/presentation.dart';

extension DataHelpers<T> on Either<Failure, T> {
  DataState<T> toState(DataState<T> oldState, [Pagination? pagination]) {
    return fold(
      (l) {
        if (oldState is DataStateLoaded<T>) {
          return DataState<T>.loaded(
            data: oldState.data,
            pagination: oldState.pagination,
            failure: l,
          );
        } else {
          return DataState<T>.empty(failure: l);
        }
      },
      (r) {
        if (oldState is DataStateLoaded<T>) {
          pagination = oldState.pagination;
        }
        return DataState<T>.loaded(data: r, pagination: pagination);
      },
    );
  }
}

extension DataCubitHelpers<T> on Cubit<DataState<T>> {
  Future<void> loadData(
    Future<Either<Failure, T>> Function() method, {
    Pagination? pagination,
    void Function(T data)? onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    final oldState = state;
    emit(const DataState.loading());

    final response = await method();
    emit(response.toState(oldState, pagination));

    if (response.isLeft() && onFailure != null) {
      final failure = response.getLeft().toNullable()!;
      onFailure(failure);
    } else if (response.isRight() && onSuccess != null) {
      final data = response.getRight().toNullable()!;
      onSuccess(data);
    }
  }

  Future<void> slientLoadData(
    Future<Either<Failure, T>> Function() method, {
    void Function(T data)? onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    if (state is! DataStateLoaded) return Future(() => null);

    final oldState = state as DataStateLoaded<T>;
    emit(DataState.slientLoading(
      data: oldState.data,
    ));

    final response = await method();
    emit(response.toState(oldState));

    if (response.isLeft() && onFailure != null) {
      final failure = response.getLeft().toNullable()!;
      onFailure(failure);
    } else if (response.isRight() && onSuccess != null) {
      final data = response.getRight().toNullable()!;
      onSuccess(data);
    }
  }

  Future<void> loadDataMore(
    Future<Either<Failure, T>> Function(Pagination pagination) method, {
    void Function(T data)? onSuccess,
    void Function(Failure failure)? onFailure,
  }) async {
    if (state is! DataStateLoaded) return Future(() => null);

    final oldState = state as DataStateLoaded<T>;
    if (oldState.pagination == null) return Future(() => null);

    emit(DataState.slientLoading(
      data: oldState.data,
      pagination: oldState.pagination!,
    ));
    final response = await method(oldState.pagination!.nextPage());
    dynamic newState = response.toState(
      oldState.copyWith(
        pagination: oldState.pagination!.nextPage(),
      ),
    );

    if (newState is DataStateLoaded<T> && response.isRight()) {
      newState = DataState.loaded(
        data: ((oldState.data as List)..addAll((newState.data as List))) as T,
        pagination: newState.pagination,
      );
    }

    emit(newState as DataState<T>);

    if (response.isLeft() && onFailure != null) {
      final failure = response.getLeft().toNullable()!;
      onFailure(failure);
    } else if (response.isRight() && onSuccess != null) {
      final data = response.getRight().toNullable()!;
      onSuccess(data);
    }
  }
}
