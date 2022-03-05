import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freshflowtask/src/helpers/locator.dart';
import 'package:freshflowtask/src/network/auth_repo.dart';

final AutoDisposeChangeNotifierProvider<LoginViewModel> loginProvider =
    ChangeNotifierProvider.autoDispose<LoginViewModel>((ref) => LoginViewModel());

class LoginViewModel extends ChangeNotifier {
  AuthRepo authRepo = locator<AuthRepo>();

  late TextEditingController emailController;
  late TextEditingController passwordController;
  late FocusNode emailNode;
  late FocusNode passwordNode;

  bool loading = false;
  String? errorMessage;

  LoginViewModel() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    emailNode = FocusNode();
    passwordNode = FocusNode();
  }

  Future<bool> login() async {
    try {
      errorMessage = null;
      toggleLoading(on: true);
      await authRepo.login(email: emailController.text, password: passwordController.text);
      return true;
    } on String catch (error) {
      /// General error handling, to be replaced with a switch statement to handle each
      /// firebase error case and set error the related TextField
      errorMessage = error;
      return false;
    } finally {
      toggleLoading(on: false);
    }
  }

  toggleLoading({required bool on}) {
    loading = on;
    notifyListeners();
  }
}
