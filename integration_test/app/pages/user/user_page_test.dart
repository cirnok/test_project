import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';

import '../../../constants.dart';
import '../../../helpers.dart';

void main() {
  testWidgets('UserPage', (WidgetTester tester) async {
    await initPage(tester, '/users/1');
    await testUserPage(tester);
  });
}

Future<void> testUserPage(WidgetTester tester, [User? user]) async {
  _checkWidgets(tester, user);
  await scrollTest(tester);
  _checkWidgets(tester, user);

  await _testCompanyDialog(tester);

  _checkWidgets(tester, user);
  await scrollTest(tester);
  _checkWidgets(tester, user);
}

void _checkWidgets(WidgetTester tester, [User? user]) {
  expect(find.textContaining(RegExp(r"^@[a-zA-Z0-9\_\-]+$")), findsOneWidget);
  expect(find.byIcon(FeatherIcons.user), findsOneWidget);
  expect(find.byIcon(FeatherIcons.chevronRight), findsWidgets);

  if (user != null) {
    expect(find.text(user.name), findsOneWidget);
    expect(find.text("@${user.username}"), findsOneWidget);
  }
}

Future<void> _testCompanyDialog(WidgetTester tester) async {
  await tester.tap(find.textContaining(localize.company));
  await pump(tester);
  await tester.tapAt(const Offset(0, 0));
  await pump(tester);
}
