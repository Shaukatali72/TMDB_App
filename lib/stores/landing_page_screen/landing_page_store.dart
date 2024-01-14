import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import 'package:tmdb/screens/favourites.dart';
import 'package:tmdb/screens/home.dart';
import 'package:tmdb/screens/profile.dart';
import 'package:tmdb/screens/search.dart';
import 'package:tmdb/flavors/flavor_config.dart';
import 'package:tmdb/routes/navigation_service.dart';
import 'package:tmdb/utils/asset_images.dart';
import 'package:tmdb/utils/colors.dart';
import 'package:tmdb/utils/strings.dart';
import 'package:tmdb/stores/search_screen/search_movies_store.dart';

part 'landing_page_store.g.dart';

class LandingPageStore = _LandingStore with _$LandingPageStore;

abstract class _LandingStore with Store {
  _LandingStore() {
    if (FlavorConfig.isDev) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        devFlavorAlert();
      });
    } else if (FlavorConfig.isProd) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        prodFlavorAlert();
      });
    }
  }

  void uatFlavorAlert() {
    Future.delayed(const Duration(seconds: 3), NavigationService().popIt);
    showDialog(
      context: NavigationService().currentContext,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.btmNvgColor,
          title: const Text(
            AppStrings.txtForUatFlavor,
            style: TextStyle(
              fontSize: 25,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }

  void devFlavorAlert() {
    Future.delayed(const Duration(seconds: 3), NavigationService().popIt);
    showDialog(
      context: NavigationService().currentContext,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.btmNvgColor,
          title: const Text(
            AppStrings.txtForDevFlavor,
            style: TextStyle(
              fontSize: 25,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }

  void prodFlavorAlert() {
    Future.delayed(const Duration(seconds: 3), NavigationService().popIt);
    showDialog(
      context: NavigationService().currentContext,
      barrierDismissible: false,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: AppColors.btmNvgColor,
          title: const Text(
            AppStrings.txtForProdFlavor,
            style: TextStyle(
              fontSize: 25,
              color: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }

  @observable
  int selectedIndex = 0;

  final List<String> navBarIcons = [
    AppIcons.iconForHome,
    AppIcons.iconForSearch,
    AppIcons.iconForHeart,
    AppIcons.iconForProfile,
  ];

  final List<Widget> pages = [
    const Home(
      key: PageStorageKey('1'),
    ),
    Provider(
      create: (_) => SearchMoviesStore(),
      child: const SearchField(
        key: PageStorageKey('2'),
      ),
    ),
    const Favourites(
      key: PageStorageKey('3'),
    ),
    const Profile(
      key: PageStorageKey('4'),
    ),
  ];
}
