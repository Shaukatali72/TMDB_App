import '/routes/navigation_service.dart';
import '/routes/routes.dart';

/* TODO: To convert this to [Store] class move all methods to _OtpVerificationStore class */

class OtpVerificationStore {
  void goToResetScreen() {
    NavigationService().replaceScreen(MyRoutes.resetPasswordRoute);
  }
}


