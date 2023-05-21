import 'package:flutter/material.dart';
import 'package:kenapa/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kenapa/common/routes/routes.dart';
import 'package:kenapa/common/theme/dark_theme.dart';
import 'package:kenapa/common/theme/light_theme.dart';
import 'package:kenapa/feature/welcome/pages/welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: const WelcomePage(),
      onGenerateRoute: Routes.onGenerateRoute);
  }
}