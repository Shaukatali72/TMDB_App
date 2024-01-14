import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/colors.dart';

class ShimmerLoaderCasts extends StatelessWidget {
  const ShimmerLoaderCasts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.btmNvgColor,
      highlightColor: AppColors.primaryColor,
      child: SizedBox(
        height: 255,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 20,
          itemBuilder: (_, index) {
            return SizedBox(
              width: 130,
              child: Padding(
                padding: const EdgeInsets.only(left: 28),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        height: 140,
                        width: 100,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
