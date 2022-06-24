import 'package:flutter_test/flutter_test.dart';

import '../../../constants.dart';
import '../../../helpers.dart';

void main() {
  testWidgets('AlbumPage', (WidgetTester tester) async {
    await initPage(tester, '/albums/1');
    await testAlbumPage(tester);
  });
}

Future<void> testAlbumPage(WidgetTester tester) async {
  _checkWidgets(tester);
  await scrollTest(tester);
  _checkWidgets(tester);
}

void _checkWidgets(WidgetTester tester) {
  expect(find.text(localize.album), findsOneWidget);
}
