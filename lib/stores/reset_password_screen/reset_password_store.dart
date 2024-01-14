import 'package:flutter/cupertino.dart';
import '/routes/navigation_service.dart';
import '/routes/routes.dart';

/* TODO: To convert this to [Store] class move all methods to _ResetPasswordStore class */

class ResetPasswordStore {
  final formKey = GlobalKey<FormState>();

  void goToLoginScreen() {
    if (formKey.currentState!.validate()) {
      NavigationService().replaceScreen(MyRoutes.loginRoute);
    }
  }
}
