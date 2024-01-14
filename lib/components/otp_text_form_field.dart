import 'package:flutter/material.dart';
import '/utils/reusable_widgets.dart';

class OtpTextFormField extends StatelessWidget {
  const OtpTextFormField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        6,
        (_) {
          return const TextFormFieldForOtp();
        },
      ),
    );
  }
}
