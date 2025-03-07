import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xff00B894);
  static const Color secondary = Colors.white;
  static const Color error = Color.fromARGB(255, 205, 108, 108);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // textFormFileTheme
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
      selectionColor: primary,
      selectionHandleColor: primary,
    ),
    // elevatedButtonTheme
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: primary,
            foregroundColor: secondary,
            shape: const StadiumBorder(),
            elevation: 8,
            textStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ))),
    // inputDecorationTheme
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) =>
          states.contains(WidgetState.error) ? error : primary),
      suffixIconColor: WidgetStateColor.resolveWith((Set<WidgetState> states) =>
          states.contains(WidgetState.error) ? error : primary),
      filled: true,
      fillColor: Colors.white.withValues(alpha: 0.7),
      floatingLabelStyle: WidgetStateTextStyle.resolveWith(
        (Set<WidgetState> states) => TextStyle(
          color: states.contains(WidgetState.error) ? error : primary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: primary,
          width: 1,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: primary,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: error,
          width: 1.5,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Colors.grey,
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
    ),
    // textButtonTheme
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: primary)),
  );
}
