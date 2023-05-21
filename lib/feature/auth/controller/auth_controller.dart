import 'package:flutter/material.dart';
import 'package:kenapa/feature/auth/repository/auth_repository.dart';
import 'package:riverpod/riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController {
  final AuthRepository authRepository;

  AuthController({required this.authRepository});

  void verifySmsCode(
      {required BuildContext context,
      required String smsCodeId,
      required String smsCode,
      required bool mounted}) {
    authRepository.verifySmsCode(
        context: context,
        smsCodeId: smsCodeId,
        smsCode: smsCode,
        mounted: mounted);
  }

  void sendSmsCode(
      {required BuildContext context, required String phoneNumber}) {
    authRepository.sendSmsCode(context: context, phoneNumber: phoneNumber);
  }
}
