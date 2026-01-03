import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
  static const primaryColorLight = Color(0xff060B21);
  static final lightTheme = ThemeData.light().copyWith(
      brightness: Brightness.light,
      scaffoldBackgroundColor: Colors.white,
      primaryColor: primaryColorLight,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: primaryColorLight.withValues(alpha: 0.2),
        elevation: 0,
        selectedItemColor: primaryColorLight,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 11,
            fontWeight: FontWeight.w600),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColorLight,
          shape: CircleBorder(),
          foregroundColor: Colors.white),
      tabBarTheme: TabBarThemeData(indicatorColor: Colors.transparent),
      textTheme: TextTheme(
        // body
        bodySmall: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 12, // spec: 12
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:0]{index=0}
            ),
        bodyMedium: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 14, // spec: 14
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:1]{index=1}
            ),
        bodyLarge: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 16, // spec: 16
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:2]{index=2}
            ),

        // display
        displaySmall: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 36, // spec: 36
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:3]{index=3}
            ),
        displayMedium: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 45, // spec: 45
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:4]{index=4}
            ),
        displayLarge: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 57, // spec: 57
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:5]{index=5}
            ),

        // headlines
        headlineSmall: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 24, // spec: 24
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:6]{index=6}
            ),
        headlineMedium: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 28, // spec: 28
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:7]{index=7}
            ),
        headlineLarge: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 32, // spec: 32
            fontWeight:
                FontWeight.w400 // regular :contentReference[oaicite:8]{index=8}
            ),

        // titles
        titleSmall: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 14, // spec: 14
            fontWeight:
                FontWeight.w500 // medium :contentReference[oaicite:9]{index=9}
            ),
        titleMedium: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 16, // spec: 16
            fontWeight: FontWeight
                .w500 // medium :contentReference[oaicite:10]{index=10}
            ),
        titleLarge: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 22, // spec: 22
            fontWeight: FontWeight
                .w400 // regular :contentReference[oaicite:11]{index=11}
            ),

        // labels
        labelSmall: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 11, // spec: 11
            fontWeight: FontWeight
                .w500 // medium :contentReference[oaicite:12]{index=12}
            ),
        labelMedium: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 12, // spec: 12
            fontWeight: FontWeight
                .w500 // medium :contentReference[oaicite:13]{index=13}
            ),
        labelLarge: GoogleFonts.jua(
            color: Color(0xff060B21),
            fontSize: 14, // spec: 14
            fontWeight: FontWeight
                .w500 // medium :contentReference[oaicite:14]{index=14}
            ),
      ));
}

// Display: only for ultra-important, very short phrases—think “Welcome,” “42,” or “Sale.”
// Headline: for major headings that guide the user through content—article titles, section names.
// Title: for labeling UI components—cards, dialogs, tabs—when you need emphasis but not as loud as a headline.
// Body: for all running text in your app—paragraphs, lists, captions.
// Label: for UI chrome—buttons, form-field labels, badges, overlines.
