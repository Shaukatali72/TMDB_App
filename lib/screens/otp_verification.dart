import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/components/otp_text_form_field.dart';
import '/utils/colors.dart';
import '/utils/reusable_widgets.dart';
import '/utils/strings.dart';
import '../stores/otp_verification_screen/otp_verification_store.dart';

class OtpVerification extends StatelessWidget {
  const OtpVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataForOtp = context.read<OtpVerificationStore>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: Form(
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
              top: 200,
              left: 25,
              child: Column(
                children: [
                  const Text(
                    AppStrings.txtForVerifyEmailAddress,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text(
                    AppStrings.txtForEnterOtp,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 200),
                    child: OtpTextFormField(),
                  ),
                  const SizedBox(height: 70),
                  ElevatedButton(
                    onPressed: _dataForOtp.goToResetScreen,
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
                      AppStrings.txtForVerifyOtpBtn,
                      style: TextStyle(
                        color: AppColors.black,
                        fontSize: 20,
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
