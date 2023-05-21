import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kenapa/common/widgets/custom_icon_button.dart';
import 'package:kenapa/feature/auth/controller/auth_controller.dart';
import 'package:kenapa/feature/auth/widgets/custom_text_field.dart';
import 'package:kenapa/common/extension/custom_theme_extension.dart';

class VerificationPage extends ConsumerWidget {
  const VerificationPage(
      {super.key, required this.smsCodeId, required this.phoneNumber});

  final String smsCodeId;
  final String phoneNumber;

  void verifySmsCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref.read(authControllerProvider).verifySmsCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: true);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        title: Text(
          'Verifikasi nomor ponsel',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [CustomIconButton(onTap: () {}, icon: Icons.more_vert)],
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                        style: TextStyle(
                            color: context.theme.greyColor, height: 1.5),
                        children: [
                          const TextSpan(
                              text:
                                  'Anda mencoba untuk mendaftarkan +628984170335 sebelum meminta kode terbaru. '),
                          TextSpan(
                              text: 'Nomor ponsel salah?',
                              style: TextStyle(color: context.theme.blueColor))
                        ])),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: CustomTextField(
                  hintText: '- - -  - - -',
                  fontSize: 30,
                  autoFocus: true,
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    if (value.length == 6) {
                      return verifySmsCode(context, ref, value);
                    }
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Masukkan kode 6 digit',
                style: TextStyle(color: context.theme.greyColor),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Icon(
                    Icons.message,
                    color: context.theme.greyColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text('Kirim ulang SMS',
                      style: TextStyle(color: context.theme.greyColor))
                ],
              ),
              Divider(
                color: context.theme.blueColor!.withOpacity(0.2),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    color: context.theme.greyColor,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Call Odi for help',
                    style: TextStyle(color: context.theme.greyColor),
                  )
                ],
              )
            ],
          )),
    );
  }
}
