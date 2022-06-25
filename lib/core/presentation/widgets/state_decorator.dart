import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';

class UProviderBuilder<T> extends StatelessWidget {
  const UProviderBuilder({
    Key? key,
    required this.provider,
    required this.builder,
  }) : super(key: key);

  final DataViewModelProvider<T> provider;
  final Widget Function(BuildContext context, DataState<T> data) builder;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [provider],
      child: BlocBuilder<DataViewModel<DataState<T>>, DataState<T>>(
        builder: builder,
      ),
    );
  }
}

class UProvidedStateDecorator<T> extends StatelessWidget {
  const UProvidedStateDecorator({
    Key? key,
    required this.provider,
    required this.builder,
    this.sliver = false,
  }) : super(key: key);

  factory UProvidedStateDecorator.sliver({
    Key? key,
    required DataViewModelProvider<T> provider,
    required Widget Function(BuildContext context, T data, Failure? failure)
        builder,
  }) {
    return UProvidedStateDecorator(
      key: key,
      provider: provider,
      builder: builder,
      sliver: true,
    );
  }

  final DataViewModelProvider<T> provider;
  final Widget Function(BuildContext context, T data, Failure? failure) builder;
  final bool sliver;

  @override
  Widget build(BuildContext context) {
    return UProviderBuilder<T>(
      provider: provider,
      builder: ((context, data) {
        return UStateDecorator<T>(
          state: data,
          builder: (data, failure) => builder(context, data, failure),
          sliver: sliver,
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
    this.sliver = false,
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
      sliver: true,
    );
  }

  final DataState<T> state;
  final Widget Function(T data, Failure? failure) builder;
  final bool sliver;

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

    if (!sliver) {
      return result;
    } else {
      return SliverToBoxAdapter(child: result);
    }
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
