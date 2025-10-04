import 'package:flutter/material.dart';

class AppColors {
  static const Color lightPrimary = Color(0xFF1565C0); // Blue 800
  static const Color lightOnPrimary = Colors.white;
  static const Color lightPrimaryContainer = Color(0xFFDCEFFF);

  static const Color lightSecondary = Color(0xFF03A9F4); // Light blue
  static const Color lightOnSecondary = Colors.white;
  static const Color lightBackground = Color(0xFFF4F8FF); // very light blue-ish
  static const Color lightSurface = Colors.white;
  static const Color lightOnSurface = Color(0xFF0B2540); // dark navy for text

  // Dark palette (adaptado para modo oscuro)
  static const Color darkPrimary = Color(0xFF90CAF9); // Blue 200
  static const Color darkOnPrimary = Color(
    0xFF07263c,
  ); // dark text on light primary in dark mode
  static const Color darkPrimaryContainer = Color(0xFF0B2540);

  static const Color darkSecondary = Color(0xFF64B5F6);
  static const Color darkBackground = Color(0xFF071226); // very dark blue/navy
  static const Color darkSurface = Color(0xFF0F1A27);
  static const Color darkOnSurface = Colors.white70;

  // Common
  static const Color error = Color(0xFFB00020);
}

class AppThemes {
  // Light color scheme
  static final ColorScheme _lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.lightPrimary,
    onPrimary: AppColors.lightOnPrimary,
    primaryContainer: AppColors.lightPrimaryContainer,
    secondary: AppColors.lightSecondary,
    onSecondary: AppColors.lightOnSecondary,
    secondaryContainer: Color(0xFFBEE7FF),
    background: AppColors.lightBackground,
    onBackground: AppColors.lightOnSurface,
    surface: AppColors.lightSurface,
    onSurface: AppColors.lightOnSurface,
    error: AppColors.error,
    onError: Colors.white,
  );

  // Dark color scheme
  static final ColorScheme _darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: AppColors.darkPrimary,
    onPrimary: AppColors.darkOnPrimary,
    primaryContainer: AppColors.darkPrimaryContainer,
    secondary: AppColors.darkSecondary,
    onSecondary: Colors.black87,
    secondaryContainer: Color(0xFF1E3A57),
    background: AppColors.darkBackground,
    onBackground: AppColors.darkOnSurface,
    surface: AppColors.darkSurface,
    onSurface: AppColors.darkOnSurface,
    error: AppColors.error,
    onError: Colors.black,
  );

  // Light ThemeData
  static final ThemeData lightTheme = ThemeData.from(
    colorScheme: _lightColorScheme,
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: _lightColorScheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _lightColorScheme.primary,
      foregroundColor: _lightColorScheme.onPrimary,
      elevation: 1,
      centerTitle: true,
      iconTheme: IconThemeData(color: _lightColorScheme.onPrimary),
      titleTextStyle: TextStyle(
        color: _lightColorScheme.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: _lightColorScheme.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFFF0F6FF),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _lightColorScheme.primary.withOpacity(0.12),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _lightColorScheme.primary.withOpacity(0.08),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: _lightColorScheme.surface,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _lightColorScheme.secondary,
      foregroundColor: _lightColorScheme.onSecondary,
      elevation: 6,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _lightColorScheme.surface,
      selectedItemColor: _lightColorScheme.primary,
      unselectedItemColor: _lightColorScheme.onSurface.withOpacity(0.6),
      showUnselectedLabels: true,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),
    dividerTheme: DividerThemeData(
      color: _lightColorScheme.onSurface.withOpacity(0.08),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _lightColorScheme.primary,
      contentTextStyle: TextStyle(
        color: _lightColorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      ),
      behavior: SnackBarBehavior.floating,
    ),
    // Text theme - mantenemos jerarquía y buen contraste
    textTheme: Typography.material2021(
      platform: TargetPlatform.android,
    ).black.apply(
      bodyColor: _lightColorScheme.onSurface,
      displayColor: _lightColorScheme.onSurface,
    ),
    iconTheme: IconThemeData(color: _lightColorScheme.onSurface),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(_lightColorScheme.primary),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(_lightColorScheme.primary),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected))
          return _lightColorScheme.primary.withOpacity(0.4);
        return _lightColorScheme.onSurface.withOpacity(0.2);
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected))
          return _lightColorScheme.primary;
        return Colors.white;
      }),
    ),
  );

  // Dark ThemeData
  static final ThemeData darkTheme = ThemeData.from(
    colorScheme: _darkColorScheme,
    useMaterial3: true,
  ).copyWith(
    scaffoldBackgroundColor: _darkColorScheme.background,
    appBarTheme: AppBarTheme(
      backgroundColor: _darkColorScheme.surface,
      foregroundColor: _darkColorScheme.onSurface,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: _darkColorScheme.onSurface),
      titleTextStyle: TextStyle(
        color: _darkColorScheme.onSurface,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: _darkColorScheme.primary,
        foregroundColor: _darkColorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: _darkColorScheme.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF0B1724),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _darkColorScheme.onSurface.withOpacity(0.12),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: _darkColorScheme.onSurface.withOpacity(0.08),
        ),
      ),
    ),
    cardTheme: CardTheme(
      color: _darkColorScheme.surface,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: _darkColorScheme.secondary,
      foregroundColor: _darkColorScheme.onSecondary,
      elevation: 4,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: _darkColorScheme.surface,
      selectedItemColor: _darkColorScheme.primary,
      unselectedItemColor: _darkColorScheme.onSurface.withOpacity(0.6),
      showUnselectedLabels: true,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),
    dividerTheme: DividerThemeData(
      color: _darkColorScheme.onSurface.withOpacity(0.12),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: _darkColorScheme.surface,
      contentTextStyle: TextStyle(
        color: _darkColorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      behavior: SnackBarBehavior.floating,
    ),
    textTheme: Typography.material2021(
      platform: TargetPlatform.android,
    ).white.apply(
      bodyColor: _darkColorScheme.onSurface,
      displayColor: _darkColorScheme.onSurface,
    ),
    iconTheme: IconThemeData(color: _darkColorScheme.onSurface),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateProperty.all(_darkColorScheme.primary),
    ),
    radioTheme: RadioThemeData(
      fillColor: MaterialStateProperty.all(_darkColorScheme.primary),
    ),
    switchTheme: SwitchThemeData(
      trackColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return _darkColorScheme.primary.withValues(alpha: 0.5);
        }
        return _darkColorScheme.onSurface.withValues(alpha: 0.2);
      }),
      thumbColor: MaterialStateProperty.resolveWith((states) {
        if (states.contains(MaterialState.selected)) {
          return _darkColorScheme.primary;
        }
        return Colors.white;
      }),
    ),
  );
}
