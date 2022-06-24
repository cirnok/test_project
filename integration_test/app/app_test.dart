import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/infrastructure/infrastructure.dart';
import 'package:test_project/core/presentation/presentation.dart';

import '../helpers.dart';

void main() {
  testWidgets('Application initialization', (tester) async {
    await initApplication(tester);
    await _testApplication(tester);
  });
}

Future<void> initApplication(WidgetTester tester) async {
  final pathProviderData = await initPathProvider();
  await tester.pumpWidget(
    ProviderScope(
      overrides: [
        pathProvider.overrideWithValue(pathProviderData),
      ],
      child: Application(
        defaultLocale: const Locale('en'),
      ),
    ),
  );

  await pump(tester);
}

Future<void> _testApplication(WidgetTester tester) async {
  expect(find.byType(Scaffold), findsOneWidget);
}
