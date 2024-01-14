import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '/utils/asset_images.dart';
import '/utils/colors.dart';
import '/utils/strings.dart';
import '../stores/profile_screen/profile_store.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _dataForProfile = context.read<ProfileStore>();

    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 70,
              right: 50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      radius: 40,
                      child: Observer(
                        builder: (_) {
                          return CircleAvatar(
                            backgroundImage:
                                _dataForProfile.imageFile?.path != ''
                                    ? Image.file(
                                        _dataForProfile.imageFile!,
                                      ).image
                                    : Image.network(
                                        AppUrl.linkForProfilePic,
                                      ).image,
                            radius: 37,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      left: 42,
                      top: 40,
                      child: IconButton(
                        onPressed: _dataForProfile.requestPermission,
                        icon: const CircleAvatar(
                          radius: 14,
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.camera_alt,
                            color: AppColors.btmNvgColor,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Observer(builder: (_) {
                      return Text(
                        _dataForProfile.userValue != ''
                            ? _dataForProfile.userValue
                            : 'No user Found',
                        style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 30,
                        ),
                      );
                    }),
                    const SizedBox(height: 5),
                    Observer(
                      builder: (_) {
                        return Text(
                          _dataForProfile.emailValue != ''
                              ? _dataForProfile.emailValue
                              : '@gmail.com',
                          style: const TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 15,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Divider(
            color: AppColors.primaryColor,
            thickness: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              onTap: _dataForProfile.goToAboutUs,
              leading: const Icon(
                Icons.verified_user,
                color: AppColors.primaryColor,
                size: 30,
              ),
              title: const Text(
                AppStrings.txtForAboutUs,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: ListTile(
              leading: SvgPicture.asset(
                AppIcons.iconForLogOut,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
                height: 30,
              ),
              title: const Text(
                AppStrings.txtforLogout,
                style: TextStyle(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                ),
              ),
              onTap: _dataForProfile.alertDialog,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
