import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/presentation/presentation.dart';

import '../../../constants.dart';
import '../../../helpers.dart';

void main() {
  testWidgets('PostListPage', (WidgetTester tester) async {
    await initPage(tester, '/users/1/posts');
    await testPostListPage(tester);
  });
}

Future<void> testPostListPage(WidgetTester tester) async {
  _checkWidgets(tester);
  await scrollTest(tester);
  _checkWidgets(tester);
}

void _checkWidgets(WidgetTester tester) {
  expect(find.text(localize.posts), findsOneWidget);
  expect(find.byIcon(FeatherIcons.book), findsWidgets);
}
