import 'package:flutter/cupertino.dart';

import 'package:tmdb/routes/navigation_service.dart';
import 'package:tmdb/routes/routes.dart';
import 'package:tmdb/shared_preferences/shared_preferences_instance.dart';


class LoginStore {
  final formKey = GlobalKey<FormState>();

  final checkingController = TextEditingController();

  void clickForLogin() {
    if (formKey.currentState!.validate() && SharedPrefs.instance?.getEmail() == checkingController.text) {
      NavigationService().replaceScreen(MyRoutes.landingPageRoute);
    }
  }

  void clickForSignUp() {
    NavigationService().replaceScreen(MyRoutes.signUpRoute);
  }

  void clickForForgotPassword() {
    NavigationService().replaceScreen(MyRoutes.forgotPasswordRoute);
  }
}
