import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '/routes/navigation_service.dart';
import '/routes/routes.dart';
import '/utils/colors.dart';
import '/utils/strings.dart';
import '../../shared_preferences/shared_preferences_instance.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStore with _$ProfileStore;

abstract class _ProfileStore with Store {
  _ProfileStore() {
    getUserData();
    getEmailData();
    getProfileData();
  }
  @observable
  File? imageFile = File('');

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      imageFile = File('');
      String? path = result.files.single.path;
      if (path != null) {
        Directory tempDir = await getTemporaryDirectory();
        File file = File('${tempDir.path}/selected_image.jpg');
        await file.writeAsBytes(await File(path).readAsBytes());
        imageFile = file;
        SharedPrefs.instance?.setProfileImage(file.path);
      }
    }
  }

  Future<void> requestPermission() async {
    final PermissionStatus result;

    if (Platform.isAndroid || Platform.isIOS) {
      result = await Permission.storage.request();
      if (result.isGranted) {
        pickFile();
      } else if (result.isDenied) {
        debugPrint('Permission Denied');
      } else if (result.isPermanentlyDenied) {
        openAppSettings();
      }
    }
  }

  void alertDialog() {
    showDialog(
      context: NavigationService().currentContext,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.btmNvgColor,
          title: const Text(
            AppStrings.txtForLogoutAlert,
            style: TextStyle(
              fontSize: 25,
              color: AppColors.primaryColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: NavigationService().popIt,
              child: const Text(
                AppStrings.txtForNo,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                SharedPrefs.instance?.clearPreference();
                NavigationService().replaceScreen(MyRoutes.loginRoute);
              },
              child: const Text(
                AppStrings.txtForYes,
                style: TextStyle(
                  fontSize: 17,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @observable
  String userValue = '';

  @observable
  String emailValue = '';

  void getUserData() async {
    userValue = SharedPrefs.instance?.getUserName() ?? '';
  }

  void getEmailData() async {
    emailValue = SharedPrefs.instance?.getEmail() ?? '';
  }

  void getProfileData() async {
    imageFile = File(SharedPrefs.instance?.getProfileImage() ?? '');
  }

  void goToAboutUs() {
    NavigationService().navigateToScreen(MyRoutes.aboutUsRoute);
  }
}
