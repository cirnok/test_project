import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';

class UBlocDecorator<B extends StateStreamable<DataState<S>>, S>
    extends StatelessWidget {
  const UBlocDecorator({
    Key? key,
    this.bloc,
    required this.builder,
  }) : super(key: key);

  final B? bloc;
  final Widget Function(S data, Failure? failure) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, DataState<S>>(
      bloc: bloc,
      builder: (context, state) => UStateDecorator(
        state: state,
        builder: builder,
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
      assert(dataState is DataStateLoaded || dataState is DataStateLoadingMore);

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
        const Center(child: Text('loading')),
      ],
    );
  }
}
