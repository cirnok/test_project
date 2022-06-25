import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/main.dart';

import '../helpers.dart';

void main() {
  testWidgets('Application initialization', (tester) async {
    await initApplication(tester);
    await _testApplication(tester);
  });
}

Future<void> initApplication(WidgetTester tester) async {
  final rootScope = await createServiceScope();

  await tester.pumpWidget(
    Provider(
      create: (_) => rootScope.serviceProvider,
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
