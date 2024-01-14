import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/colors.dart';

class PlaceholderCast extends StatelessWidget {
  const PlaceholderCast({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.btmNvgColor,
      highlightColor: AppColors.primaryColor,
      child: const SizedBox(
        height: 200,
        width: 100,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
