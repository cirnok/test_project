import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/domain/domain.dart';

void main() {
  group('Entities', () {
    test('Pagination', () {
      const pagination = Pagination(start: 0, limit: 50);
      expect(pagination.start, 0);
      expect(pagination.limit, 50);
      expect(pagination.nextPage().start, 50);
      expect(pagination.nextPage().limit, 50);
    });
  });
}
