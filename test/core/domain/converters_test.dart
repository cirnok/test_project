import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/core/domain/domain.dart';

void main() {
  group('Converters', () {
    test('StringToDouble', () {
      const converter = StringToDoubleConverter();
      expect(converter.fromJson('1.0'), 1.0);
      expect(converter.toJson(1.0), '1.0');
    });
  });
}
