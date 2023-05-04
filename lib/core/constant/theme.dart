import 'package:flutter/material.dart';
import 'color.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemePreferences {
  ThemeData get dark;
  ThemeData get light;
}

class ThemePreferencesImpl extends ThemePreferences {
  @override
  ThemeData get dark => ThemeData(
        scaffoldBackgroundColor: DarkColor.background,
        colorScheme: const ColorScheme(
          primary: DarkColor.textPrimary,
          onPrimary: DarkColor.textOnPrimary,
          onSecondary: DarkColor.lightGrey,
          background: DarkColor.background,
          brightness: Brightness.dark,
          outline: DarkColor.background,
          onBackground: DarkColor.lightGrey,
          error: DarkColor.red,
          onError: DarkColor.red,
          onSurface: DarkColor.divider,
          surface: DarkColor.yellow,
          surfaceVariant: DarkColor.pinkVariant,
          secondary: DarkColor.yellow,
        ),
        dialogBackgroundColor: DarkColor.background,
        dialogTheme: DialogTheme(
          backgroundColor: Colors.grey.shade800,
          titleTextStyle: const TextStyle(
            color: DarkColor.textPrimary,
          ),
          contentTextStyle: const TextStyle(
            color: DarkColor.textPrimary,
          ),
        ),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: DarkColor.background,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              TextStyle(
                color: DarkColor.red,
              ),
            ),
          ),
        ),
        dividerColor: DarkColor.divider,
        primaryTextTheme: GoogleFonts.robotoTextTheme(),
        textTheme: GoogleFonts.interTextTheme(),
        scrollbarTheme: ScrollbarThemeData(
          interactive: true,
          thumbVisibility: MaterialStateProperty.all(true),
          radius: const Radius.circular(10.0),
          thumbColor: MaterialStateProperty.all(Colors.grey),
          thickness: MaterialStateProperty.all(5.0),
          minThumbLength: 100,
        ),
      );

  @override
  ThemeData get light => throw UnimplementedError();
}
