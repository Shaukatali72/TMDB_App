import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/utils/colors.dart';
import '/utils/helper_class.dart';
import '/utils/reusable_widgets.dart';
import '/utils/strings.dart';
import '../stores/login_screen/login_store.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _dataForLogin = context.read<LoginStore>();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: Form(
        key: _dataForLogin.formKey,
        child: SingleChildScrollView(
          child: Stack(
            children: [
              SizedBox(
                height: _size.height * 1.50,
                width: MediaQuery.of(context).size.width,
                child: CustomPaint(
                  painter: CurvePainterForLogin(),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  _size.height * 0.02,
                  _size.height * 0.08,
                  0,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.txtForWelcomeTo,
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      AppStrings.txtForCreative,
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      AppStrings.txtForPleaseLoginToContinue,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        _size.height * 0.01,
                        0,
                        0,
                        0,
                      ),
                      child: SizedBox(
                        width: 370,
                        child: TextFormFieldForLogin(
                          labelText:
                              AppStrings.txtForEmailUsernameForLabelAndHint,
                          hintText:
                              AppStrings.txtForEmailUsernameForLabelAndHint,
                          isPasswordType: false,
                          dataForHelper: HelperData.emailValidation,
                          controllerData: _dataForLogin.checkingController,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(
                        8,
                        0,
                        0,
                        0,
                      ),
                      child: SizedBox(
                        width: 370,
                        child: TextFormFieldForLogin(
                          labelText: AppStrings.txtForPasswordForLabelAndHint,
                          hintText: AppStrings.txtForPasswordForLabelAndHint,
                          isPasswordType: true,
                          dataForHelper: HelperData.passwordValidation,
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        _size.height * 0.01,
                        0,
                        0,
                        0,
                      ),
                      child: SizedBox(
                        width: 370,
                        child: ElevatedButtonForLogin(
                          onTap: _dataForLogin.clickForLogin,
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        _size.height * 0.01,
                        0,
                        0,
                        0,
                      ),
                      child: TextButton(
                        onPressed: _dataForLogin.clickForForgotPassword,
                        child: const Text(
                          AppStrings.txtForForgotPassword,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        _size.height * 0.19,
                        _size.height * 0.10,
                        0,
                        _size.height * 0.02,
                      ),
                      child: const Text(
                        AppStrings.txtForOr,
                        style: TextStyle(
                          fontSize: 27,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 50),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        _size.height * 0.01,
                        0,
                        0,
                        0,
                      ),
                      child: SizedBox(
                        width: 370,
                        child: ElevatedButtonForSignUp(
                          onTap: _dataForLogin.clickForSignUp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
