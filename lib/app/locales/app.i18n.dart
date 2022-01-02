// GENERATED FILE, do not edit!
import 'package:i18n/i18n.dart' as i18n;

String get _languageCode => 'en';
String _plural(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.plural(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _ordinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.ordinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);
String _cardinal(int count,
        {String? zero,
        String? one,
        String? two,
        String? few,
        String? many,
        String? other}) =>
    i18n.cardinal(count, _languageCode,
        zero: zero, one: one, two: two, few: few, many: many, other: other);

class App {
  const App();
  String get locale => "en";
  String get languageCode => "en";
  String get users => """Users""";
  String get profile => """Profile""";
  String get albums => """Albums""";
  String get posts => """Posts""";
  String get album => """Album""";
}

Map<String, String> get appMap => {
      """users""": """Users""",
      """profile""": """Profile""",
      """albums""": """Albums""",
      """posts""": """Posts""",
      """album""": """Album""",
    };
