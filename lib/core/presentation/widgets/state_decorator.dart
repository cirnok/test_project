import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';

class UProvidedStateDecorator<T> extends StatelessWidget {
  const UProvidedStateDecorator({
    Key? key,
    required this.provider,
    required this.builder,
    this.sliver = false,
  }) : super(key: key);

  factory UProvidedStateDecorator.sliver({
    Key? key,
    required ProviderListenable<DataState<T>> provider,
    required Widget Function(T data, Failure? failure, WidgetRef ref) builder,
  }) {
    return UProvidedStateDecorator(
      key: key,
      provider: provider,
      builder: builder,
      sliver: true,
    );
  }

  final ProviderListenable<DataState<T>> provider;
  final Widget Function(T data, Failure? failure, WidgetRef ref) builder;
  final bool sliver;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) => UStateDecorator<T>(
        state: ref.watch(provider),
        builder: (data, failure) => builder(data, failure, ref),
        sliver: sliver,
      ),
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

    if (state is DataStateEmpty) {
      result = _Empty(state as DataStateEmpty);
    } else if (state is DataStateLoading) {
      final dataState = state as DataStateLoading<T>;
      result = _ChildWithLoader<T>(dataState, builder);
    } else {
      final dataState = state as dynamic;
      assert(
          dataState is DataStateLoaded || dataState is DataStateSlientLoading);

      return builder(dataState.data, dataState.failure);
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

  final DataStateEmpty<T> state;

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

  final DataStateLoading<T> state;
  final Widget Function(T data, Failure? failure) builder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (state.data != null) builder(state.data!, null),
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
