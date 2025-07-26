import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// This class defines the default light theme for the application.
// It provides consistent styling for various UI elements like text, buttons, and app bars.
class AppTheme {
  // Private constructor to prevent instantiation, as this class only provides static methods.
  AppTheme._();

  // Defines the light theme data for the application.
  static ThemeData lightTheme = ThemeData(
    // Set the overall brightness to light.
    brightness: Brightness.light,

    // Define the primary color for the application.
    primaryColor: Colors.blue,

    // Define the accent color (now secondary in Material 3).
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.blue,
      accentColor: Colors.lightBlueAccent, // Used as secondary color in Material 3
      brightness: Brightness.light,
    ).copyWith(
      // Define a custom background color for the overall scaffold.
      background: Colors.white,
      // Define a custom surface color for cards, sheets, etc.
      surface: Colors.white,
      // Define the color for text and icons on primary background.
      onPrimary: Colors.white,
      // Define the color for text and icons on secondary background.
      onSecondary: Colors.black,
      // Define the color for text and icons on background.
      onBackground: Colors.black87,
      // Define the color for text and icons on surface.
      onSurface: Colors.black87,
      // Define the error color.
      error: Colors.red,
      // Define the color for text and icons on error background.
      onError: Colors.white,
    ),

    // Define the background color for the Scaffold.
    scaffoldBackgroundColor: Colors.white,

    // Configure the AppBar theme.
    appBarTheme: AppBarTheme(
      color: Colors.blue, // AppBar background color.
      foregroundColor: Colors.white, // Color for icons and text on the AppBar.
      elevation: 4.0, // Shadow beneath the AppBar.
      titleTextStyle: GoogleFonts.openSans(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // Color for icons in the AppBar.
      ),
    ),

    // Configure the text theme using Google Fonts 'Open Sans'.
    // This applies 'Open Sans' to all default text styles.
    textTheme: GoogleFonts.openSansTextTheme(
      ThemeData.light().textTheme.copyWith(
        titleLarge: const TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        titleSmall: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        titleMedium: const TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        headlineLarge: const TextStyle(
          fontSize: 32.0,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
        bodyMedium: const TextStyle(
          fontSize: 16.0,
          color: Colors.black54,
        ),
      ),
    ),

    // Configure the TextButton theme.
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.blue, // Text color for TextButton.
        textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w600, // Slightly bolder text.
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Rounded corners for buttons.
        ),
      ),
    ),

    // Configure the ElevatedButton theme.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue, // Background color for ElevatedButton.
        foregroundColor: Colors.white, // Text/icon color for ElevatedButton.
        textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),

    // Configure the OutlinedButton theme.
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blue, // Text/icon color for OutlinedButton.
        side: const BorderSide(color: Colors.blue, width: 1.5), // Border color and width.
        textStyle: GoogleFonts.openSans(
          fontWeight: FontWeight.w600,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      ),
    ),

    // Configure the FloatingActionButton theme.
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)), // More rounded FAB
      ),
    ),

    // Configure input decoration theme (for TextField, TextFormField).
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none, // No border by default
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Colors.blue, width: 2.0), // Blue border when focused
      ),
      labelStyle: GoogleFonts.openSans(color: Colors.grey[700]),
      hintStyle: GoogleFonts.openSans(color: Colors.grey[500]),
      contentPadding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
    ),

    // Configure card theme.
    cardTheme: CardThemeData(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.all(8.0),
      color: Colors.white,
    ),

    // Configure dialog theme.
    dialogTheme: DialogThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      backgroundColor: Colors.white,
      titleTextStyle: GoogleFonts.openSans(
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
      contentTextStyle: GoogleFonts.openSans(
        fontSize: 16.0,
        color: Colors.black54,
      ),
    ),

    // Configure tooltip theme.
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.8),
        borderRadius: BorderRadius.circular(4.0),
      ),
      textStyle: GoogleFonts.openSans(color: Colors.white),
    ),
  );
}
