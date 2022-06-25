import 'package:test_project/core/presentation/presentation.dart';

typedef CreateProviderCallback<T> = T Function(
  BuildContext context,
  ServiceProvider provider,
);

T _createProvider<T>(
  CreateProviderCallback<T> create,
  BuildContext context,
) {
  return create(context, context.read<ServiceProvider>());
}

class SPProvider<T> extends Provider<T> {
  SPProvider(
    CreateProviderCallback<T> create, {
    super.key,
    super.child,
  }) : super(create: (context) => _createProvider(create, context));
}

class SPBlocProvider<T extends StateStreamableSource> extends BlocProvider<T> {
  SPBlocProvider(
    CreateProviderCallback<T> create, {
    super.key,
    super.child,
  }) : super(create: (context) => _createProvider(create, context));
}
