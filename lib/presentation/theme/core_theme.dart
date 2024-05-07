part of 'theme.dart';

class AppCoreTheme {
  static const int primaryColorValue = 0xFF66b2ea;
  static const primaryColor = Color(primaryColorValue);
  Color s = const Color(0xFFECBEC0);
  static const MaterialColor primarySwatch = MaterialColor(
    primaryColorValue,
    <int, Color>{
      50: Color(0xFFe3f1fb),
      100: Color(0xFFbbddf6),
      200: Color(0xFF90c8f0),
      300: Color(primaryColorValue),
      400: Color(0xFF47a2e7),
      500: Color(0xFF2992e3),
      600: Color(0xFF2385d6),
      700: Color(0xFF1b73c3),
      800: Color(0xFF1463b1),
      900: Color(0xFF074692),
    },
  );

  static const int accentColorValue = 0xFFfaee9f;
  static const accentColor = Color(accentColorValue);
  static const MaterialColor accentSwatch = MaterialColor(
    accentColorValue,
    <int, Color>{
      100: Color(0xFFfcf5c5),
      200: Color(accentColorValue),
      400: Color(0xFFf6e35f),
      700: Color(0xFFefb63c),
    },
  );

  static SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle.light.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    systemStatusBarContrastEnforced: true,
    systemNavigationBarColor: Colors.white,
    systemNavigationBarContrastEnforced: true,
    systemNavigationBarIconBrightness: Brightness.light,
  );

  static ThemeData theme = ThemeData(
    useMaterial3: true,
    primaryColor: primaryColor,
    primarySwatch: primarySwatch,
    scaffoldBackgroundColor: Colors.grey.shade100,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primaryColor,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
    // AppBar Theme
    appBarTheme: AppBarTheme(
      elevation: 10.0,
      toolbarHeight: kToolbarHeight + 10,
      backgroundColor: AppCoreTheme.primaryColor,
      foregroundColor: ColorTheme.white,
      surfaceTintColor: ColorTheme.white,
      systemOverlayStyle: systemUiOverlayStyle,
      titleTextStyle: TextStyle(
        fontSize: 18,
        color: ColorTheme.white,
        fontWeight: FontWeight.w600,
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
    ),
    // BottomNavigationBar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 5.0,
      backgroundColor: Colors.white,
      showUnselectedLabels: false,
      showSelectedLabels: true,
      selectedIconTheme: IconThemeData(
        color: primaryColor,
      ),
      unselectedIconTheme: IconThemeData(
        color: Colors.grey,
      ),
      selectedLabelStyle: TextStyle(
        color: primaryColor,
      ),
      unselectedLabelStyle: TextStyle(
        color: Colors.grey,
      ),
      unselectedItemColor: Colors.white,
      selectedItemColor: primaryColor,
    ),
    // Bottom AppBar Theme
    bottomAppBarTheme: const BottomAppBarTheme(
      elevation: 10,
      color: Colors.white,
      surfaceTintColor: Colors.white,
    ),
    // ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        surfaceTintColor: primaryColor,
        foregroundColor: Colors.white,
        fixedSize: const Size.fromHeight(kBottomNavigationBarHeight - 12.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    ),
    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
      ),
    ),
    // FAB Theme
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    // ListTile Theme
    listTileTheme: const ListTileThemeData(
      dense: true,
    ),
    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      isDense: true,
      hintStyle: TextStyle(
        color: Colors.grey.shade500,
        fontSize: 14,
      ),
      // contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      errorStyle: const TextStyle(
        height: 0,
      ),
      errorMaxLines: 1,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.shade400,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: primaryColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppCoreColor.error.main,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppCoreColor.error.main,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      constraints: const BoxConstraints(
        minHeight: 55,
      ),
    ),
    // Modal Dialog Theme
    dialogTheme: DialogTheme(
      // titleTextStyle: TextStyle(fontSize: 12,),
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    // Card Theme
    cardTheme: CardTheme(
      elevation: 1.0,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    // Tab Bar Theme
    tabBarTheme: TabBarTheme(
      labelPadding: EdgeInsets.zero,
      labelColor: primaryColor,
      labelStyle: const TextStyle(
        color: primaryColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelColor: ColorTheme.neutral.shade600,
      unselectedLabelStyle: TextStyle(
        color: ColorTheme.neutral.shade600,
        fontSize: 14,
      ),
      dividerColor: Colors.transparent,
      indicatorColor: primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      overlayColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.pressed)) {
          return AppCoreColor.primary.focus;
        }

        return null;
      }),
    ),
    // ExpansionTile
    expansionTileTheme: const ExpansionTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Colors.transparent,
        ),
      ),
    ),
    // CheckBox Button Theme
    checkboxTheme: CheckboxThemeData(
      splashRadius: 5.0,
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }

        return null;
      }),
    ),
    // Radio Button Theme
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return primaryColor;
        }

        return primaryColor;
      }),
    ),
  );
}
