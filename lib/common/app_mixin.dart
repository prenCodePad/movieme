import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/login/login_api.dart';
import 'package:flutter_app/repositories/login/login_api_impl.dart';
import 'package:flutter_app/repositories/movie/movie_api.dart';
import 'package:flutter_app/repositories/movie/movie_api_impl.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../config/config.dart';
import '../controllers/controllers.dart';

mixin AppMixin {
  AppSizes get sizes => GetIt.I<AppSizes>();
  AppTheme get theme => GetIt.I<AppTheme>();
  SignInController get snc => Get.put(SignInController());
  LoginApi get loginService => const LoginApiImpl();
  MovieApi get movieService => const MovieApiImpl();
  Widget verticalGap(double height) => SizedBox(height: height);
  Widget horizontalGap(double width) => SizedBox(height: width);
  SnackbarController whiteSnackbar(String title, String message) =>
      Get.snackbar(title, message, backgroundColor: Colors.white);
}
