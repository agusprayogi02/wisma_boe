part of 'theme.dart';

class AppCoreColor {
  static AppCoreColorType primary = AppCoreColorType.primary;
  static const AppCoreColorType secondary = AppCoreColorType.secondary;
  static const AppCoreColorType success = AppCoreColorType.success;
  static const AppCoreColorType error = AppCoreColorType.error;
  static const AppCoreColorType info = AppCoreColorType.info;
}

class AppCoreColorType {
  final Color main;
  final Color surface;
  final Color border;
  final Color hover;
  final Color pressed;
  final Color focus;

  const AppCoreColorType({
    required this.main,
    required this.surface,
    required this.border,
    required this.hover,
    required this.pressed,
    required this.focus,
  });

  static AppCoreColorType primary = AppCoreColorType(
    main: AppCoreTheme.primaryColor,
    surface: const Color(0x132992e3),
    border: AppCoreTheme.primarySwatch.shade100,
    hover: AppCoreTheme.primarySwatch.shade700,
    pressed: AppCoreTheme.primarySwatch.shade800,
    focus: AppCoreTheme.primarySwatch.shade900.withOpacity(33),
  );

  static const AppCoreColorType secondary = AppCoreColorType(
    main: Color(0xFFF6C23E),
    surface: Color.fromRGBO(246, 194, 62, 0.08),
    border: Color(0xFFF9D67E),
    hover: Color(0xFFA48129),
    pressed: Color(0xFF524115),
    focus: Color(0xFFFCEBBF),
  );

  static const AppCoreColorType success = AppCoreColorType(
    main: Color(0xFF27C165),
    surface: Color(0xFFEAFFF3),
    border: Color(0xFFB9EED0),
    hover: Color(0xFF26AA5E),
    pressed: Color(0xFF176638),
    focus: Color.fromRGBO(46, 204, 113, 0.2),
  );

  static const AppCoreColorType error = AppCoreColorType(
    main: Color(0xFFE2480F),
    surface: Color(0xFFFDE8CE),
    border: Color(0xFFFCCA9D),
    hover: Color(0xFFA21C07),
    pressed: Color(0xFF6C0203),
    focus: Color.fromRGBO(204, 34, 0, 0.2),
  );

  static const AppCoreColorType info = AppCoreColorType(
    main: Color(0xFF2798FF),
    surface: Color(0xFFD4EAFF),
    border: Color(0xFFB7DDFF),
    hover: Color(0xFF207FD4),
    pressed: Color(0xFF134C80),
    focus: Color.fromRGBO(39, 152, 255, 0.2),
  );
}
