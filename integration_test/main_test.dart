import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/modules/photo/presentation/presentation.dart';
import 'package:test_project/modules/user/domain/domain.dart';
import 'package:test_project/modules/user/presentation/presentation.dart';

import 'app/app_test.dart';
import 'app/pages/photo/album_list_page_test.dart';
import 'app/pages/photo/album_page_test.dart';
import 'app/pages/photo/photo_list_page_test.dart';
import 'app/pages/post/post_list_page_test.dart';
import 'app/pages/post/post_page_test.dart';
import 'app/pages/user/user_list_page_test.dart';
import 'app/pages/user/user_page_test.dart';
import 'constants.dart';
import 'helpers.dart';

void main() {
  testWidgets('User imitation (check all pages)', (tester) async {
    await initApplication(tester);
    await testUserListPage(tester);

    final user = await _toUserPage(tester);
    await testUserPage(tester, user);

    await _testAlbums(tester);
    await _testPosts(tester);

    await scrollTest(tester);
    await back(tester);

    pathIsCurrentRoute(tester, '/users');
    await scrollTest(tester);
  });
}

Future<void> _testAlbums(WidgetTester tester) async {
  await _toAlbumListPage(tester);
  await testAlbumListPage(tester);
  await _toAlbumPage(tester);
  await testAlbumPage(tester);
  await _toPhotoListPage(tester);
  await testPhotoListPage(tester);

  await back(tester);
  await back(tester);
  await back(tester);
  await _toAlbumPage(tester);
  await testAlbumPage(tester);
  await _toPhotoListPage(tester);
  await testPhotoListPage(tester);

  await back(tester);
  await back(tester);
}

Future<void> _testPosts(WidgetTester tester) async {
  await _toPostListPage(tester);
  await testPostListPage(tester);
  await _toPostPage(tester);
  await testPostPage(tester);

  await back(tester);
  await back(tester);
  await _toPostPage(tester);
  await testPostPage(tester);

  await back(tester);
}

Future<User> _toUserPage(WidgetTester tester) async {
  final userListItemFinder = find.byType(UUserListItem).first;
  final user = tester.widget<UUserListItem>(userListItemFinder).user;

  await tester.tap(userListItemFinder);
  await pump(tester);

  return user;
}

Future<void> _toAlbumListPage(WidgetTester tester) async {
  await tester.scrollUntilVisible(
    find.text(localize.albums),
    100,
    scrollable: scrollableFirstFinder,
  );

  await tester.tap(find.text(localize.albums));
  await pump(tester);
}

Future<void> _toAlbumPage(WidgetTester tester) async {
  await tester.scrollUntilVisible(
    find.byIcon(FeatherIcons.image).first,
    100,
    scrollable: scrollableFirstFinder,
  );

  await tester.tap(find.byIcon(FeatherIcons.image).first);
  await pump(tester);
}

Future<void> _toPhotoListPage(WidgetTester tester) async {
  await tester.tap(find.byType(UPhotoListItem).first);
  await pump(tester);
}

Future<void> _toPostPage(WidgetTester tester) async {
  await tester.scrollUntilVisible(
    find.byIcon(FeatherIcons.book).first,
    100,
    scrollable: scrollableFirstFinder,
  );

  await tester.tap(find.byIcon(FeatherIcons.book).first);
  await pump(tester);
}

Future<void> _toPostListPage(WidgetTester tester) async {
  await tester.scrollUntilVisible(
    find.text(localize.posts),
    100,
    scrollable: scrollableFirstFinder,
  );

  await tester.tap(find.text(localize.posts));
  await pump(tester);
}
