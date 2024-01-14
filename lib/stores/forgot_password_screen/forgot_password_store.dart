import 'package:flutter/cupertino.dart';
import '/routes/routes.dart';
import '/routes/navigation_service.dart';

/*TODO: To convert this to [Store] class move all methods to _ForgotPasswordStore class*/

class ForgotPasswordStore {
  final formKey = GlobalKey<FormState>();

  void goToOtpScreen() {
    if (formKey.currentState!.validate()) {
      NavigationService().replaceScreen(MyRoutes.otpVerificationRoute);
    }
  }
}
