import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/presentation/presentation.dart';

import '../../../constants.dart';
import '../../../helpers.dart';

final _imageFinder = find.byType(Image);
final _photoContentFinder = find.byType(PhotoContent);

void main() {
  testWidgets('PhotoListPage', (WidgetTester tester) async {
    await initPage(tester, '/albums/1/view');
    await testPhotoListPage(tester);
  });
}

Future<void> testPhotoListPage(WidgetTester tester) async {
  _checkWidgets(tester);
  await scrollTest(tester);
  await _testPhotoSwiper(tester);
  _checkWidgets(tester);
}

void _checkWidgets(WidgetTester tester) {
  expect(find.text(localize.photo), findsOneWidget);
}

Future<void> _testPhotoSwiper(WidgetTester tester) async {
  final count = tester.widget<PhotoContent>(_photoContentFinder).photos.length;

  final center = tester.getCenter(_imageFinder);
  const toRight = Offset(-400, 0);
  const toLeft = Offset(400, 0);

  await retry(count + 1, () async {
    await tester.dragFrom(center, toRight);
    await pump(tester);
  });

  await retry(count + 1, () async {
    await tester.dragFrom(center, toLeft);
    await pump(tester);
  });
}
