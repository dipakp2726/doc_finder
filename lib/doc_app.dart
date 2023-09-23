import 'package:docfinder/core/configs/configs.dart';
import 'package:docfinder/core/configs/styles/app_theme.dart';
import 'package:docfinder/features/doctor/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DocApp extends ConsumerWidget {
  /// Creates new instance of [DocApp]
  const DocApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Doc Finder',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themedata,
      home: const Homepage(),
    );
  }
}
