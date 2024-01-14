import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '/utils/colors.dart';
import '/utils/strings.dart';
import 'asset_images.dart';

class CurvePainterForLogin extends CustomPainter {
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    var paint = Paint();
    paint.color = AppColors.primaryColor;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(
      0,
      size.height * 0.38,
    );
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 2.1,
      size.width,
      size.height * 0.38,
    );
    path.lineTo(
      size.width,
      0,
    );
    path.lineTo(
      0,
      0,
    );

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TextFormFieldForLogin extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool isPasswordType;
  final TextEditingController? controllerData;
  final String? Function(String?)? dataForHelper;

  const TextFormFieldForLogin({
    Key? key,
    this.hintText,
    this.labelText,
    required this.dataForHelper,
    required this.isPasswordType,
    this.controllerData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerData,
      obscureText: isPasswordType,
      cursorColor: AppColors.black,
      style: const TextStyle(
        color: AppColors.black,
        fontSize: 17,
      ),
      textInputAction: TextInputAction.next,
      validator: dataForHelper,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.black,
        ),
        errorStyle: const TextStyle(
          color: AppColors.black,
          fontSize: 17,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(
          top: 10,
          left: 20,
        ),
        labelStyle: const TextStyle(
          color: AppColors.black,
        ),
        filled: true,
        fillColor: AppColors.bgColorForTextFormFieldLogin,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonForLogin extends StatelessWidget {
  final VoidCallback? onTap;

  const ElevatedButtonForLogin({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 30,
          shadowColor: AppColors.primaryColor,
        ),
        child: const Text(
          AppStrings.txtForLoginBtn,
          style: TextStyle(
            color: AppColors.bgColorForTextFormFieldLogin,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}

class CurvePainterForSignup extends CustomPainter {
  @override
  void paint(
    Canvas canvas,
    Size size,
  ) {
    var paint = Paint();
    paint.color = AppColors.primaryColor;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(
      0,
      size.width * 0.65,
    );
    path.quadraticBezierTo(
      size.width / 2,
      size.height / 6,
      size.width,
      size.height * 0.31,
    );
    path.lineTo(
      size.width,
      0,
    );
    path.lineTo(
      0,
      0,
    );

    canvas.drawPath(
      path,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class TextFormFieldForSignUp extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool? isPasswordType;
  final TextEditingController? controllerData;
  final String? Function(String?)? dataForHelper;

  const TextFormFieldForSignUp({
    Key? key,
    this.labelText,
    this.hintText,
    this.dataForHelper,
    this.isPasswordType,
    this.controllerData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerData,
      obscureText: isPasswordType!,
      cursorColor: AppColors.primaryColor,
      style: const TextStyle(
        color: AppColors.hintStyleColor,
        fontSize: 17,
      ),
      textInputAction: TextInputAction.next,
      validator: dataForHelper,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 17,
        ),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.hintStyleColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(
          top: 10,
          left: 20,
        ),
        labelStyle: const TextStyle(
          color: AppColors.hintStyleColor,
        ),
        filled: true,
        fillColor: AppColors.textFieldBackColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}

class ElevatedButtonForSignUp extends StatelessWidget {
  final VoidCallback? onTap;

  const ElevatedButtonForSignUp({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          elevation: 30,
          shadowColor: AppColors.primaryColor,
        ),
        child: const Text(
          AppStrings.txtForSignUpBtn,
          style: TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
      ),
    );
  }
}

class TextFormFieldForReset extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final bool isPasswordType;
  final String? Function(String?)? dataForHelper;

  const TextFormFieldForReset(
      {Key? key,
      required this.isPasswordType,
      this.hintText,
      this.labelText,
      this.dataForHelper})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPasswordType,
      cursorColor: AppColors.primaryColor,
      style: const TextStyle(
        color: AppColors.hintStyleColor,
        fontSize: 17,
      ),
      textInputAction: TextInputAction.next,
      validator: dataForHelper,
      decoration: InputDecoration(
        errorStyle: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 17,
        ),
        labelText: labelText,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: AppColors.hintStyleColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.only(
          top: 10,
          left: 20,
        ),
        labelStyle: const TextStyle(
          color: AppColors.hintStyleColor,
        ),
        filled: true,
        fillColor: AppColors.textFieldBackColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}

class TextFormFieldForOtp extends StatelessWidget {
  const TextFormFieldForOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 6),
      height: 60,
      width: 60,
      child: TextFormField(
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.textFieldBackColor,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        style: const TextStyle(
          color: AppColors.primaryColor,
          fontSize: 23,
        ),
        cursorColor: AppColors.primaryColor,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String errorData;

  const ErrorMessage({
    super.key,
    required this.errorData,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            AppImages.imageForError,
            height: 260,
            width: 260,
          ),
          Text(
            errorData,
            style: const TextStyle(
              color: AppColors.red,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}

class ErrorImageHandler extends StatelessWidget {
  final Size dynamicSize;

  const ErrorImageHandler({
    super.key,
    required this.dynamicSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
        AppUrl.errorImage,
        width: dynamicSize.width,
        height: dynamicSize.height,
      ),
    );
  }
}
