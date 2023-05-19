import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:kenapa/common/helper/show_alert_dialog.dart';
import 'package:kenapa/common/utils/coloors.dart';
import 'package:kenapa/common/widgets/custom_elevated_button.dart';
import 'package:kenapa/common/widgets/custom_icon_button.dart';
import 'package:kenapa/feature/auth/widgets/custom_text_field.dart';
import 'package:kenapa/common/extension/custom_theme_extension.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  sendCodeToPhone() {
    final phone = phoneNumberController.text;
    final name = countryNameController.text;

    if (phone.isEmpty) {
      return showAlertDialog(
          context: context, message: 'Masukkan nomor ponsel anda');
    }

    if (phone.length < 9) {
      return showAlertDialog(
          context: context,
          message:
              'Nomor ponsel yang ada masukkan terlalu pendek. Mohon masukkan beserta kode negara yang benar.');
    } else if (phone.length > 10) {
      return showAlertDialog(context: context, message: 'Nomor ponsel anda');
    }
  }

  showCountryCodePicker() {
    showCountryPicker(
        context: context,
        showPhoneCode: true,
        favorite: ['ID'],
        countryListTheme: CountryListThemeData(
            bottomSheetHeight: 600,
            backgroundColor: Theme.of(context).backgroundColor,
            flagSize: 22,
            borderRadius: BorderRadius.circular(20),
            textStyle: TextStyle(color: context.theme.greyColor),
            inputDecoration: InputDecoration(
                labelStyle: TextStyle(color: context.theme.greyColor),
                prefixIcon:
                    const Icon(Icons.language, color: Coloors.greenDark),
                hintText: 'Cari nama atau kode negara',
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: context.theme.greyColor!.withOpacity(0.2))),
                focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(color: Coloors.greenDark)))),
        onSelect: (country) {
          countryNameController.text = country.name;
          countryCodeController.text = country.countryCode;
        });
  }

  @override
  void initState() {
    countryNameController = TextEditingController(text: 'Indonesia');
    countryCodeController = TextEditingController(text: '62');
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          'Masukkan nomor HP',
          style: TextStyle(color: context.theme.authAppbarTextColor),
        ),
        centerTitle: true,
        actions: [
          CustomIconButton(
            onTap: () {},
            icon: Icons.more_vert,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: 'Sif akan melakukan verifikasi pada nomor ponselmu. ',
                    style:
                        TextStyle(color: context.theme.greyColor, height: 1.5),
                    children: [
                      TextSpan(
                          text: 'Berapa nomor ponsel saya?',
                          style: TextStyle(color: context.theme.blueColor))
                    ])),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: CustomTextField(
              onTap: showCountryCodePicker,
              controller: countryNameController,
              readOnly: true,
              suffixIcon: const Icon(
                Icons.arrow_drop_down,
                color: Coloors.greenDark,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              children: [
                SizedBox(
                  width: 70,
                  child: CustomTextField(
                    onTap: showCountryCodePicker,
                    controller: countryCodeController,
                    prefixText: '+',
                    readOnly: true,
                  ),
                ),
                const SizedBox(height: 10),
                Expanded(
                    child: CustomTextField(
                  controller: phoneNumberController,
                  hintText: 'Nomor ponsel',
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                ))
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'Proses menggunakan koneksi internet',
            style: TextStyle(color: context.theme.greyColor),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomElevatedButton(
        onPressed: sendCodeToPhone,
        text: 'Selanjutnya',
        buttonWidth: 120,
      ),
    );
  }
}
