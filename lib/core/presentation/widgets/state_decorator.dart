import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/core/domain/domain.dart';

class UDataStateViewModelBuilder<V extends DataViewModel<T>, T>
    extends StatelessWidget {
  const UDataStateViewModelBuilder({
    super.key,
    required this.builder,
  });

  final BlocWidgetBuilder<DataState<T>> builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<V, DataState<T>>(
      builder: (context, state) => builder(context, state),
    );
  }
}

class UWrappedStateDecorator<V extends DataViewModel<T>, T>
    extends StatelessWidget {
  const UWrappedStateDecorator({
    Key? key,
    required this.builder,
  }) : super(key: key);

  factory UWrappedStateDecorator.sliver({
    Key? key,
    required Widget Function(BuildContext context, T data, Failure? failure)
        builder,
  }) {
    return UWrappedStateDecorator(
      key: key,
      builder: builder,
    );
  }

  final Widget Function(BuildContext context, T data, Failure? failure) builder;

  @override
  Widget build(BuildContext context) {
    return UDataStateViewModelBuilder<V, T>(
      builder: ((context, data) {
        return UStateDecorator<T>(
          state: data,
          builder: (data, failure) => builder(context, data, failure),
        );
      }),
    );
  }
}

class UStateDecorator<T> extends StatelessWidget {
  const UStateDecorator({
    Key? key,
    required this.state,
    required this.builder,
  }) : super(key: key);

  factory UStateDecorator.sliver({
    Key? key,
    required DataState<T> state,
    required Widget Function(T data, Failure? failure) builder,
  }) {
    return UStateDecorator(
      key: key,
      state: state,
      builder: builder,
    );
  }

  final DataState<T> state;
  final Widget Function(T data, Failure? failure) builder;

  @override
  Widget build(BuildContext context) {
    Widget result;

    if (state.isLoading) {
      result = _ChildWithLoader<T>(state, builder);
    } else if (state.isEmpty) {
      result = _Empty(state);
    } else {
      return builder(state.data as T, state.failure);
    }

    return result;
  }
}

class _Empty<T> extends StatelessWidget {
  const _Empty(
    this.state, {
    Key? key,
  }) : super(key: key);

  final DataState<T> state;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: DesignConstants.padding,
        child: Text('empty (${state.failure})'),
      ),
    );
  }
}

class _ChildWithLoader<T> extends StatelessWidget {
  const _ChildWithLoader(
    this.state,
    this.builder, {
    Key? key,
  }) : super(key: key);

  final DataState<T> state;
  final Widget Function(T data, Failure? failure) builder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (state.data != null) builder(state.data as T, null),
        const Center(
          child: Padding(
            padding: DesignConstants.padding,
            child: UPreloader(),
          ),
        ),
      ],
    );
  }
}
