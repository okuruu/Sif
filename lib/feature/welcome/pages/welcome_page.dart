import 'package:flutter/material.dart';
import 'package:kenapa/common/routes/routes.dart';
import 'package:kenapa/common/widgets/custom_elevated_button.dart';
import 'package:kenapa/common/extension/custom_theme_extension.dart';
import 'package:kenapa/feature/welcome/widgets/language_button.dart';
import 'package:kenapa/feature/welcome/widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  navigateToLoginPage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Image.asset('assets/images/circle.png',
                  color: context.theme.circleImageColor),
            ),
          )),
          const SizedBox(height: 40),
          Expanded(
              child: Column(
            children: [
              const Text(
                'Welcome to Sif',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const PrivacyAndTerms(),
              CustomElevatedButton(
                onPressed: () => navigateToLoginPage(context) ,
                text: 'Setujui dan Lanjutkan',
              ),
              const SizedBox(height: 50),
              const LanguageButton()
            ],
          ))
        ],
      ),
    );
  }
}
