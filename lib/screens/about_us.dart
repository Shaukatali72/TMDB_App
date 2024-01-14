import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '/utils/asset_images.dart';
import '/utils/colors.dart';
import '/utils/strings.dart';
import '../routes/navigation_service.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: AppColors.homePageColor,
        elevation: 20,
        leading: IconButton(
          onPressed: NavigationService().popIt,
          icon: const Icon(
            Icons.chevron_left,
            size: 50,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppStrings.txtForTMDBApp,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 30,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              AppStrings.txtForVersion,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 30),
            SvgPicture.asset(
              AppIcons.iconForAboutUsLogo,
              colorFilter: const ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              AppStrings.txtForTrademark,
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
