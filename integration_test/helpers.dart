import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/presentation/presentation.dart';

import 'app/app_test.dart';
import 'constants.dart';

final _applicationFinder = find.byType(Application);
final scrollableFirstFinder = find.byType(Scrollable).first;

Future<void> retry(int times, Future<void> Function() action) async {
  for (int i = 0; i < times; i++) {
    await action();
  }
}

Future<void> scrollTest(WidgetTester tester) async {
  final controller =
      tester.firstWidget<Scrollable>(find.byType(Scrollable)).controller!;

  final toDown = -controller.position.maxScrollExtent;
  final toUp = controller.position.maxScrollExtent;

  await retry(2, () async {
    await tester.drag(
      scrollableFirstFinder,
      Offset(0, toDown),
    );
    await pump(tester);
  });

  await retry(2, () async {
    await tester.drag(
      scrollableFirstFinder,
      Offset(0, toUp),
    );
    await pump(tester);
  });
}

Future<void> pump(WidgetTester tester) async {
  await tester.pumpAndSettle(duration);
  return tester.pump();
}

Future<void> initPage(WidgetTester tester, String path) async {
  await initApplication(tester);
  await pump(tester);

  final router = tester.widget<Application>(_applicationFinder).router;

  router.pushNamed(path);
  await pump(tester);

  expect(router.currentPath, path);
}

Future<void> back(WidgetTester tester) async {
  final router = tester.widget<Application>(_applicationFinder).router;

  router.navigateBack();
  await pump(tester);
}

bool pathIsCurrentRoute(WidgetTester tester, String path) {
  final router = tester.widget<Application>(_applicationFinder).router;
  return router.currentPath == path;
}
