import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config/config.dart';
import '../common/common.dart';

class SignInController extends GetxController with AppMixin {
  final isLoggedIn = false.obs;
  final loader = false.obs;
  final signUpLoader = false.obs;
  final showPassword = false.obs;
  final signInMode = false.obs;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  updateIsLoggedIn(bool b) => isLoggedIn.value = b;

  Future<bool> login() async {
    loader.value = true;
    String? validate = validateLogin();
    String? response;
    if (validate == null) {
      response = await loginService.login(usernameController.text, passwordController.text);
      if (response == null) {
        clear();
        loader.value = false;
        return true;
      }
    }
    whiteSnackbar(Constants.login, response ?? validate ?? Constants.somethingWentWrong);
    loader.value = false;
    return false;
  }

  clear() {
    usernameController.clear();
    passwordController.clear();
    showPassword.value = false;
  }

  signUp() async {
    signUpLoader.value = true;
    String? validate = validateLogin();
    String? response;
    if (validate == null) {
      response = await loginService.signUp(usernameController.text, passwordController.text);
      if (response == null) {
        whiteSnackbar(Constants.signUp, Constants.signUpSuccessful);
        signUpLoader.value = false;
        return true;
      }
    }
    whiteSnackbar(Constants.signUp, response ?? validate ?? Constants.somethingWentWrong);
    signUpLoader.value = false;

    return false;
  }

  logOut() {
    StoragePrefs.removeStorageValue('name');
    StoragePrefs.removeStorageValue('token');
  }

  String? validateLogin() {
    if (usernameController.text.isEmpty) return 'Please provide username';
    if (passwordController.text.isEmpty) return 'Please provide password';
    if (passwordController.text.length < 8 || usernameController.text.length < 8) {
      return 'Username and Password should have atleast 8 characters';
    }
    return null;
  }
}
