import 'strings.dart';

class HelperData {
  static late String passVar;

  static String? emailValidation(String? value) {
    if (value!.isEmpty) {
      return AppStrings.txtForValidationOfUsernameEmpty;
    } else if (!RegExp(AppStrings.regExForEmail).hasMatch(value)) {
      return AppStrings.errorMessageForEmail;
    }
    return null;
  }

  static String? passwordValidation(String? value) {
    if (value!.isEmpty) {
      return AppStrings.txtForValidationOfPassEmpty;
    } else if (value.length < 6) {
      return AppStrings.txtForValidationOfPassLength;
    } else if (!RegExp(AppStrings.regExForUpperCase).hasMatch(value)) {
      return AppStrings.errorMessageForUpperCase;
    } else if (!RegExp(AppStrings.regExForLowerCase).hasMatch(value)) {
      return AppStrings.errorMessageForLowerCase;
    } else if (!RegExp(AppStrings.regExForNumber).hasMatch(value)) {
      return AppStrings.errorMessageForNumber;
    } else if (!RegExp(AppStrings.regExForSpecial).hasMatch(value)) {
      return AppStrings.errorMessageForSpecial;
    } else {
      passVar = value;
    }
    return null;
  }

  static String? reEnterValidation(String? value) {
    if (value != passVar) {
      return AppStrings.errorMessageForPasswordDidNotMatch;
    }
    return null;
  }
}
