import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/utils/colors.dart';
import '/utils/reusable_widgets.dart';
import '/utils/strings.dart';
import '../stores/forgot_password_screen/forgot_password_store.dart';
import '../utils/helper_class.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataForForgotPassword = context.read<ForgotPasswordStore>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: Form(
        key: _dataForForgotPassword.formKey,
        child: Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: CurvePainterForLogin(),
              ),
            ),
            Positioned(
              top: 220,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    AppStrings.txtForForgotPassword,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 150),
                  const Padding(
                    padding: EdgeInsets.only(top: 50),
                    child: SizedBox(
                      width: 360,
                      child: TextFormFieldForSignUp(
                        labelText:
                            AppStrings.txtForEmailUsernameForLabelAndHint,
                        hintText: AppStrings.txtForEmailUsernameForLabelAndHint,
                        isPasswordType: false,
                        dataForHelper: HelperData.emailValidation,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ElevatedButton(
                      onPressed: _dataForForgotPassword.goToOtpScreen,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(300, 50),
                        backgroundColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 30,
                        shadowColor: AppColors.primaryColor,
                      ),
                      child: const Text(
                        AppStrings.txtForSendOtpBtn,
                        style: TextStyle(
                          color: AppColors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
