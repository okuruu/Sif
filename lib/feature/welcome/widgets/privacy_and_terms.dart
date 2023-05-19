import 'package:flutter/material.dart';
import 'package:kenapa/common/extension/custom_theme_extension.dart';

class PrivacyAndTerms extends StatelessWidget {
  const PrivacyAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: 'Anda dapat membaca ',
              style: TextStyle(color: context.theme.greyColor, height: 1.5),
              children: [
                TextSpan(
                    text: 'Kebijakan Privasi ',
                    style: TextStyle(color: context.theme.blueColor)),
                const TextSpan(
                    text: 'Tekan "Setuju dan Lanjutkan" untuk menyetujui '),
                TextSpan(
                    text: 'Syarat dan Ketentuan.',
                    style: TextStyle(color: context.theme.blueColor))
              ])),
    );
  }
}
