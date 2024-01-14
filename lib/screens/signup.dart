import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/utils/asset_images.dart';
import '/utils/colors.dart';
import '/utils/helper_class.dart';
import '/utils/reusable_widgets.dart';
import '/utils/strings.dart';
import '../stores/signup_screen/signup_store.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _dataForSignUp = context.read<SignUpStore>();

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.black,
      body: SingleChildScrollView(
        child: Form(
          key: _dataForSignUp.formKey,
          child: Stack(
            children: [
              SizedBox(
                height: _size.height,
                width: _size.width * 10,
                child: CustomPaint(
                  painter: CurvePainterForSignup(),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(
                  _size.height * 0.03,
                  _size.width * 0.17,
                  0,
                  0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.txtForExistingUser,
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 360,
                      child: ElevatedButtonForLogin(
                        onTap: _dataForSignUp.clickForLogin,
                      ),
                    ),
                    const SizedBox(height: 120),
                    const Text(
                      AppStrings.txtForSignUpWith,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      AppStrings.txtForCreative,
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 40),
                    SizedBox(
                      width: 360,
                      child: TextFormFieldForSignUp(
                        labelText: 'username',
                        hintText: 'username',
                        isPasswordType: false,
                        //dataForHelper: HelperData.emailValidation,
                        controllerData: _dataForSignUp.nameController,
                      ),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: 360,
                      child: TextFormFieldForSignUp(
                        labelText:
                            AppStrings.txtForEmailUsernameForLabelAndHint,
                        hintText: AppStrings.txtForEmailUsernameForLabelAndHint,
                        isPasswordType: false,
                        dataForHelper: HelperData.emailValidation,
                        controllerData: _dataForSignUp.emailController,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(
                      width: 360,
                      child: TextFormFieldForSignUp(
                        labelText: AppStrings.txtForPasswordForLabelAndHint,
                        hintText: AppStrings.txtForPasswordForLabelAndHint,
                        isPasswordType: true,
                        dataForHelper: HelperData.passwordValidation,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const SizedBox(
                      width: 360,
                      child: TextFormFieldForSignUp(
                        labelText: AppStrings.txtForPasswordForReEnter,
                        hintText: AppStrings.txtForPasswordForReEnter,
                        isPasswordType: true,
                        dataForHelper: HelperData.reEnterValidation,
                      ),
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: 360,
                      child: ElevatedButtonForSignUp(
                        onTap: _dataForSignUp.clickForSignUp,
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Center(
                      child: Text(
                        AppStrings.txtForOrSignUpWith,
                        style: TextStyle(
                          fontSize: 20,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        _size.width * 0.28,
                        _size.width * 0.04,
                        0,
                        0,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: _dataForSignUp.funcForFacebook,
                            icon: SvgPicture.asset(
                              AppIcons.iconForFacebook,
                              colorFilter: const ColorFilter.mode(
                                AppColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                            ),
                            color: AppColors.primaryColor,
                            iconSize: 40,
                          ),
                          const SizedBox(width: 30),
                          SizedBox(
                            width: 50,
                            child: CircleAvatar(
                              backgroundColor: AppColors.primaryColor,
                              child: IconButton(
                                onPressed: _dataForSignUp.funcForGoogle,
                                icon: SvgPicture.asset(
                                  AppIcons.iconForGoogle,
                                  height: 40,
                                  colorFilter: const ColorFilter.mode(
                                    AppColors.black,
                                    BlendMode.srcIn,
                                  ),
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
            ],
          ),
        ),
      ),
    );
  }
}
