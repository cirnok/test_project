import 'package:test_project/core/presentation/presentation.dart';
// ignore_for_file: subtype_of_sealed_class, prefer-correct-type-name

typedef DataViewModelProvider<T> = BlocProvider<DataViewModel<DataState<T>>>;

typedef CreateDataViewModelCallback<T> = T Function(
  BuildContext context,
  ServiceProvider provider,
);

T _createDataViewModel<T>(
  CreateDataViewModelCallback<T> create,
  BuildContext context,
) {
  return create(context, context.read<ServiceProvider>());
}

class ViewModelProvider<T, VM extends BlocBase<T>> extends BlocProvider<VM> {
  ViewModelProvider(
    CreateDataViewModelCallback<VM> create, {
    super.key,
    super.child,
  }) : super(create: (context) => _createDataViewModel(create, context));
}

class SingleDataViewModelProvider<T, VM extends SingleDataViewModel<T>>
    extends BlocProvider<VM> {
  SingleDataViewModelProvider(
    CreateDataViewModelCallback<VM> create, {
    super.key,
    super.child,
  }) : super(create: (context) => _createDataViewModel(create, context));
}

class MultiDataViewModelProvider<T, VM extends MultiDataViewModel<T>>
    extends BlocProvider<VM> {
  MultiDataViewModelProvider(
    CreateDataViewModelCallback<VM> create, {
    super.key,
    super.child,
  }) : super(create: (context) => _createDataViewModel(create, context));
}
