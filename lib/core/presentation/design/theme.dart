import 'package:test_project/core/presentation/presentation.dart';

ThemeData get theme {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      secondary: Colors.red,
      primary: Colors.black,
    ),
    textTheme: TextTheme(
      headline6: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
      subtitle1: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        color: Colors.grey[600],
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}
