import 'package:test_project/core/presentation/presentation.dart';

ThemeData get theme {
  return ThemeData.light().copyWith(
    colorScheme: const ColorScheme.light(
      secondary: Colors.white,
      primary: Colors.black,
    ),
    textTheme: textTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: DesignConstants.borderRadiusMini,
        ),
      ),
    ),
  );
}
