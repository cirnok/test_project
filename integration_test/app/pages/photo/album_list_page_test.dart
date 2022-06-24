import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/presentation/presentation.dart';

import '../../../constants.dart';
import '../../../helpers.dart';

void main() {
  testWidgets('AlbumListPage', (WidgetTester tester) async {
    await initPage(tester, '/users/1/albums');
    await testAlbumListPage(tester);
  });
}

Future<void> testAlbumListPage(WidgetTester tester) async {
  _checkWidgets(tester);
  await scrollTest(tester);
  _checkWidgets(tester);
}

void _checkWidgets(WidgetTester tester) {
  expect(find.text(localize.albums), findsOneWidget);
  expect(find.byIcon(FeatherIcons.image), findsWidgets);
}
