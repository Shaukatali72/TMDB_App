import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/colors.dart';

class PlaceholderHorizontal extends StatelessWidget {
  const PlaceholderHorizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.btmNvgColor,
      highlightColor: AppColors.primaryColor,
      child: const Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
        ),
      ),
    );
  }
}
