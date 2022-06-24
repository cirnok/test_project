import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/presentation/presentation.dart';

import '../../../constants.dart';
import '../../../helpers.dart';

final _nameTextFieldFinder = find.widgetWithText(TextFormField, localize.name);
final _emailTextFieldFinder =
    find.widgetWithText(TextFormField, localize.email);
final _writeTextTextFieldFinder =
    find.widgetWithText(TextFormField, localize.writeText);

void main() {
  testWidgets('PostPage', (WidgetTester tester) async {
    await initPage(tester, '/posts/1');
    await testPostPage(tester);
  });
}

Future<void> testPostPage(WidgetTester tester) async {
  _checkWidgets(tester);
  await scrollTest(tester);
  await _testComments(tester);
  _checkWidgets(tester);
}

void _checkWidgets(WidgetTester tester) {
  expect(find.text(localize.post), findsOneWidget);
  expect(find.text(localize.comments), findsOneWidget);
  expect(find.byIcon(FeatherIcons.user), findsWidgets);
}

Future<void> _testComments(WidgetTester tester) async {
  await _testCommentsValidation(tester);
  await _testCommentSend(tester);
}

Future<void> _testCommentsValidation(WidgetTester tester) async {
  await tester.tap(find.byIcon(FeatherIcons.messageSquare));
  await pump(tester);
  expect(find.text(localize.createComment), findsOneWidget);

  await tester.enterText(
    _nameTextFieldFinder,
    emptyString,
  );
  await tester.enterText(
    _emailTextFieldFinder,
    emptyString,
  );
  await tester.enterText(
    _writeTextTextFieldFinder,
    emptyString,
  );
  await tester.tap(find.text(localize.send));
  await pump(tester);
  expect(find.text(localize.requiredInput), findsNWidgets(3));

  await tester.enterText(
    _emailTextFieldFinder,
    defaultText,
  );
  await tester.tap(find.text(localize.send));
  await pump(tester);
  expect(find.text(localize.invalidEmail), findsOneWidget);

  await tester.tapAt(const Offset(0, 0));
  await pump(tester);
}

Future<void> _testCommentSend(WidgetTester tester) async {
  await tester.tap(find.byIcon(FeatherIcons.messageSquare));
  await pump(tester);

  await tester.enterText(
    _nameTextFieldFinder,
    defaultName,
  );
  await tester.enterText(
    _emailTextFieldFinder,
    defaultEmail,
  );
  await tester.enterText(
    _writeTextTextFieldFinder,
    defaultMultipleText,
  );
  await tester.tap(find.text(localize.send));
  await pump(tester);
  expect(find.text(localize.createComment), findsNothing);

  expect(find.text(defaultName), findsWidgets);
  expect(find.text(defaultEmail), findsWidgets);
  expect(find.text(defaultMultipleText), findsWidgets);
}
