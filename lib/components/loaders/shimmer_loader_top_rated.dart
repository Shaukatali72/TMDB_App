import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/colors.dart';

class ShimmerLoaderTopRated extends StatelessWidget {
  const ShimmerLoaderTopRated({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.btmNvgColor,
      highlightColor: AppColors.primaryColor,
      child: SizedBox(
        height: 300,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Card(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Container(
                  height: 292,
                  width: 170,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
