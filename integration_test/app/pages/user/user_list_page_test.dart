import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/presentation/presentation.dart';

import '../../../constants.dart';
import '../../../helpers.dart';

void main() {
  testWidgets('UserListPage', (WidgetTester tester) async {
    await initPage(tester, '/users');
    await testUserListPage(tester);
  });
}

Future<void> testUserListPage(WidgetTester tester) async {
  _checkWidgets(tester);
  await scrollTest(tester);
  _checkWidgets(tester);
}

void _checkWidgets(WidgetTester tester) {
  expect(find.text(localize.users), findsOneWidget);
  expect(find.byIcon(FeatherIcons.user), findsWidgets);
}
