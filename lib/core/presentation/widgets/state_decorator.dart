import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';

class UProvidedStateDecorator<T> extends StatelessWidget {
  const UProvidedStateDecorator({
    Key? key,
    required this.provider,
    required this.builder,
  }) : super(key: key);

  final ProviderListenable<DataState<T>> provider;
  final Widget Function(T data, Failure? failure, WidgetRef ref) builder;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) => UStateDecorator<T>(
        state: ref.watch(provider),
        builder: (data, failure) => builder(data, failure, ref),
      ),
    );
  }
}

class UStateDecorator<T> extends StatelessWidget {
  const UStateDecorator({
    Key? key,
    required this.state,
    required this.builder,
  }) : super(key: key);

  final DataState<T> state;
  final Widget Function(T data, Failure? failure) builder;

  @override
  Widget build(BuildContext context) {
    if (state is DataStateEmpty) {
      return _Empty(state as DataStateEmpty);
    } else if (state is DataStateLoading) {
      final dataState = state as DataStateLoading<T>;
      return _ChildWithLoader<T>(dataState, builder);
    } else {
      final dataState = state as dynamic;
      assert(
          dataState is DataStateLoaded || dataState is DataStateSlientLoading);

      return builder(dataState.data, dataState.failure);
    }
  }
}

class _Empty<T> extends StatelessWidget {
  const _Empty(
    this.state, {
    Key? key,
  }) : super(key: key);

  final DataStateEmpty<T> state;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('empty (${state.failure})'));
  }
}

class _ChildWithLoader<T> extends StatelessWidget {
  const _ChildWithLoader(
    this.state,
    this.builder, {
    Key? key,
  }) : super(key: key);

  final DataStateLoading<T> state;
  final Widget Function(T data, Failure? failure) builder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (state.data != null) builder(state.data!, null),
        const Center(child: UPreloader()),
      ],
    );
  }
}
