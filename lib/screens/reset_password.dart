import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/utils/colors.dart';
import '/utils/reusable_widgets.dart';
import '/utils/strings.dart';
import '../stores/reset_password_screen/reset_password_store.dart';
import '../utils/helper_class.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataForResetPassword = context.read<ResetPasswordStore>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: Form(
        key: _dataForResetPassword.formKey,
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
                    AppStrings.txtForResetPassword,
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 150),
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: SizedBox(
                      width: 360,
                      child: TextFormFieldForReset(
                        labelText: AppStrings.txtForNewPassword,
                        hintText: AppStrings.txtForNewPassword,
                        isPasswordType: true,
                        dataForHelper: HelperData.passwordValidation,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const SizedBox(
                    width: 360,
                    child: TextFormFieldForReset(
                      labelText: AppStrings.txtForConfirmNewPassword,
                      hintText: AppStrings.txtForConfirmNewPassword,
                      isPasswordType: true,
                      dataForHelper: HelperData.reEnterValidation,
                    ),
                  ),
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: ElevatedButton(
                      onPressed: _dataForResetPassword.goToLoginScreen,
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
                        AppStrings.txtForResetPasswordBtn,
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
