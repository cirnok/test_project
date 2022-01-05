import 'package:test_project/core/infrastructure/infrastructure.dart';
import 'package:test_project/core/presentation/presentation.dart';

void main() async {
  runApp(const ApplicationPlaceholder());
  final pathProviderData = await initPathProvider();

  runApp(ProviderScope(
    overrides: [
      pathProvider.overrideWithValue(pathProviderData),
    ],
    child: Application(),
  ));
}
