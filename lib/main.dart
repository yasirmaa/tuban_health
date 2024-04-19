import 'package:flutter/material.dart';
import 'package:tuban_health/home_page.dart';
import 'package:tuban_health/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme().theme,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

