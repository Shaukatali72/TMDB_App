import 'dart:io';

import '../../utils/strings.dart';
import 'custom_exceptions.dart';

CustomException CustomHandler(exception) {
  if (exception is SocketException) {
    return CustomException(AppStrings.txtForNoInternet);
  } else if (exception is CustomException) {
    return exception;
  } else {
    return CustomException(AppStrings.txtForSomethingWentWrong);
  }
}
