import 'package:flutter/material.dart';
import 'package:kenapa/common/theme/dark_theme.dart';
import 'package:kenapa/common/theme/light_theme.dart';
import 'package:kenapa/feature/auth/pages/verification_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kenapa',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      home: const VerificationPage());
  }
}