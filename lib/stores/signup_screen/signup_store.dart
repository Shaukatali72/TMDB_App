import 'package:flutter/material.dart';

import 'package:tmdb/routes/navigation_service.dart';
import 'package:tmdb/routes/routes.dart';
import 'package:tmdb/utils/colors.dart';
import 'package:tmdb/utils/strings.dart';
import 'package:tmdb/shared_preferences/shared_preferences_instance.dart';

/*TODO: To convert this to [Store] class move all methods to _SignUpStore class
    and create Constructor like below to get context*/

class SignUpStore {
  final BuildContext parentContext;
  SignUpStore(this.parentContext);

  final formKey = GlobalKey<FormState>();

  void funcForFacebook() {
    ScaffoldMessenger.of(parentContext).showSnackBar(
      const SnackBar(
        content: Text(
          AppStrings.txtForSnackBarOfFacebook,
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void funcForGoogle() {
    ScaffoldMessenger.of(parentContext).showSnackBar(
      const SnackBar(
        content: Text(
          AppStrings.txtForSnackBarOfGoogle,
          style: TextStyle(
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void clickForLogin() {
    NavigationService().replaceScreen(MyRoutes.loginRoute);
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void clickForSignUp() {
    if (formKey.currentState!.validate()) {
      SharedPrefs.instance?.setUserName(nameController.text);
      SharedPrefs.instance?.setEmail(emailController.text);
      NavigationService().replaceScreen(MyRoutes.loginRoute);
    }
  }
}
