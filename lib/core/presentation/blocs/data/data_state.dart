export 'data_helpers.dart';
import 'package:test_project/core/domain/domain.dart';

part 'data_state.freezed.dart';

@freezed
class DataState<T> with _$DataState {
  const factory DataState.empty({
    Failure? failure,
  }) = DataStateEmpty;

  const factory DataState.loaded({
    required T data,
    Failure? failure,
  }) = DataStateLoaded;

  const factory DataState.loading({
    T? data,
  }) = DataStateLoading;

  const factory DataState.slientLoading({
    required T? data,
  }) = DataStateSlientLoading;
}
