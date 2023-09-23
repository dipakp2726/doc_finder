import 'package:docfinder/core/configs/configs.dart';
import 'package:docfinder/features/doctor/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class DocApp extends ConsumerWidget {
  /// Creates new instance of [DocApp]
  const DocApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Doc Finder',
      debugShowCheckedModeBanner: false,
      theme: getTheme(),
      home: const Homepage(),
    );
  }

  ThemeData getTheme() {
    return ThemeData(
      primaryColor: AppColors.primary,
      chipTheme: const ChipThemeData(),
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
      ),
    );
  }
}
