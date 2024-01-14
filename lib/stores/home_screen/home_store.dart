import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '/routes/navigation_service.dart';
import '/routes/routes.dart';
import '/utils/colors.dart';
import '../../api_services/repository.dart';
import '../../components/custom_classes/custom_exceptions.dart';
import '../../models/category_movies/all_category_model.dart';
import '../../models/category_movies/category_movies_model.dart';
import '../../models/choice_chips/choice_chips_model.dart';
import '../../models/movie_arguments/movie_arguments_model.dart';
import '../../models/top_rated_movies/top_rated_movies_model.dart';
import '../../models/trending_movies/trending_movies_model.dart';
import '../../models/upcoming_movies/upcoming_movies_model.dart';
import '../../utils/strings.dart';

part 'home_store.g.dart';

class HomePageStore = _HomeStore with _$HomePageStore;

abstract class _HomeStore with Store {
  _HomeStore() {
    checkInternet();
    getTrendingMoviesData();
    getChoiceChipsData().then((_) => getCategoryMoviesData());
    getTopRatedMoviesData();
    getUpcomingMoviesData();
  }

  @observable
  late bool isLoaded = false;

  @observable
  int selectedIndex = 0;

  @observable
  String homeError = AppStrings.blankString;

  @observable
  String trendingError = AppStrings.blankString;

  @observable
  String choiceError = AppStrings.blankString;

  @observable
  String categoryError = AppStrings.blankString;

  @observable
  String topRatedError = AppStrings.blankString;

  @observable
  String upcomingError = AppStrings.blankString;

  @observable
  String searchError = AppStrings.blankString;

  @observable
  List<TrendingMoviesModel> trendingMoviesList = [];

  @observable
  List<ChoiceChipsModel> choiceChipsList = [];

  @observable
  List<CategoryMoviesModel> categoriesMovieList = [];

  @observable
  List<TopRatedMoviesModel> topRatedMoviesList = [];

  @observable
  List<UpcomingMoviesModel> upcomingMoviesList = [];

  late ConnectivityResult result;
  late StreamSubscription subscription;

  void checkNet() async {
    result = await Connectivity().checkConnectivity();
    if (result != ConnectivityResult.none) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          homeError = '';
          trendingError = '';
          choiceError = '';
          categoryError = '';
          topRatedError = '';
          upcomingError = '';

          getTrendingMoviesData();
          getChoiceChipsData().then((_) => getCategoryMoviesData());
          getTopRatedMoviesData();
          getUpcomingMoviesData();
          hasInternetDialog();
        },
      );
    } else {
      homeError = AppStrings.txtForNoInternet;
      noInternetDialog();
    }
  }

  void hasInternetDialog() async {
    final context = NavigationService().currentContext;
    final result = await (Connectivity().checkConnectivity());
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            AppStrings.txtForConnectedToInternet,
            style: TextStyle(
              color: AppColors.black,
            ),
          ),
          backgroundColor: AppColors.green,
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  void noInternetDialog() {
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
            AppStrings.txtForNoInternet,
            style: TextStyle(
              fontSize: 25,
              color: AppColors.primaryColor,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                WidgetsBinding.instance.addPostFrameCallback(
                  (_) {
                    NavigationService().popIt();
                    checkNet();
                  },
                );
              },
              child: const Text(
                AppStrings.txtForRetry,
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 17,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void checkInternet() {
    checkNet();
    subscription = Connectivity().onConnectivityChanged.listen((_) async {
      checkNet();
    });
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

  void navArgsForTrending(
    TrendingMoviesModel trendingIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: trendingIndex.backgroundImage,
        title: trendingIndex.movieTitle,
        desc: trendingIndex.movieDescription,
        rating: trendingIndex.rating,
        hero: 'trending$index',
        movieId: trendingIndex.id,
      ),
    );
  }

  void navArgsForCategory(
    CategoryMoviesModel categoryIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: categoryIndex.backgroundImage,
        title: categoryIndex.movieTitle,
        desc: categoryIndex.movieDescription,
        rating: categoryIndex.rating,
        hero: 'categories$index',
        movieId: categoryIndex.id,
      ),
    );
  }

  void navArgsForTopRated(
    TopRatedMoviesModel topRatedIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: topRatedIndex.topRatedImage,
        title: topRatedIndex.movieTitle,
        desc: topRatedIndex.movieDescription,
        rating: topRatedIndex.rating,
        hero: 'topRated$index',
        movieId: topRatedIndex.id,
      ),
    );
  }

  void navArgsForUpcoming(
    UpcomingMoviesModel upcomingIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: upcomingIndex.backgroundImage,
        title: upcomingIndex.movieTitle,
        desc: upcomingIndex.movieDescription,
        rating: upcomingIndex.rating,
        hero: 'upcoming$index',
        movieId: upcomingIndex.id,
      ),
    );
  }

  void navArgsForAllTopRated(
    TopRatedMoviesModel topRatedIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: topRatedIndex.topRatedImage,
        title: topRatedIndex.movieTitle,
        desc: topRatedIndex.movieDescription,
        rating: topRatedIndex.rating,
        hero: 'allTopRated$index',
        movieId: topRatedIndex.id,
      ),
    );
  }

  void navArgsForCategoryList(
    CategoryMoviesModel categoryListIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: categoryListIndex.backgroundImage,
        title: categoryListIndex.movieTitle,
        desc: categoryListIndex.movieDescription,
        rating: categoryListIndex.rating,
        hero: 'categories$index',
        movieId: categoryListIndex.id,
      ),
    );
  }

  List<Widget> choiceChips() {
    List<Widget> chips = [];
    for (int i = 0; i < choiceChipsList.length; i++) {
      Widget item = Padding(
        padding: const EdgeInsets.only(right: 15),
        child: ChoiceChip(
          labelPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          label: Text(
            choiceChipsList[i].chipsName,
            style: const TextStyle(
              fontSize: 20,
              color: AppColors.black,
            ),
          ),
          selected: selectedIndex == i,
          selectedColor: AppColors.primaryColor,
          onSelected: (_) {
            selectedIndex = i;
            getCategoryMoviesData();
          },
        ),
      );
      chips.add(item);
    }
    return chips;
  }

  Future<void> getTrendingMoviesData() async {
    try {
      final result = await Repository().fetchTrendingMoviesData();
      if (result.isEmpty) {
        trendingError = AppStrings.txtForNoMovieFound;
      } else {
        trendingMoviesList = result;
        isLoaded = true;
      }
    } on CustomException catch (e) {
      trendingError = e.customText;
      if (e.customText == AppStrings.txtForNoInternet) {
        homeError = e.customText;
      }
    }
  }

  Future<void> getChoiceChipsData() async {
    try {
      final result = await Repository().fetchChoiceChipsData();
      if (result.isEmpty) {
        choiceError = AppStrings.txtForNoMovieFound;
      } else {
        choiceChipsList = result;
      }
    } on CustomException catch (e) {
      choiceError = e.customText;
      categoryError = e.customText;
    }
  }

  Future<void> getCategoryMoviesData() async {
    try {
      final result = await Repository().fetchCategoryMoviesData(
        withGenres: choiceChipsList[selectedIndex].id,
        pageNumber: 10,
        isAdult: false,
      );
      if (result.isEmpty) {
        categoryError = AppStrings.txtForNoMovieFound;
      } else {
        categoriesMovieList = result;
        isLoaded = true;
      }
    } on CustomException catch (e) {
      categoryError = e.customText;
      if (e.customText == AppStrings.txtForNoInternet) {
        homeError = e.customText;
      }
    }
  }

  Future<void> getTopRatedMoviesData() async {
    try {
      final result = await Repository().fetchTopRatedMoviesData(
        pageNumber: 1,
      );
      if (result.isEmpty) {
        topRatedError = AppStrings.txtForNoMovieFound;
      } else {
        topRatedMoviesList = result;
        isLoaded = true;
      }
    } on CustomException catch (e) {
      topRatedError = e.customText;
      if (e.customText == AppStrings.txtForNoInternet) {
        homeError = e.customText;
      }
    }
  }

  Future<void> getUpcomingMoviesData() async {
    try {
      final result = await Repository().fetchUpcomingMoviesData(
        pageNumber: 1,
      );
      if (result.isEmpty) {
        upcomingError = AppStrings.txtForNoMovieFound;
      } else {
        upcomingMoviesList = result;
        isLoaded = true;
      }
    } on CustomException catch (e) {
      upcomingError = e.customText;
      if (e.customText == AppStrings.txtForNoInternet) {
        homeError = e.customText;
      }
    }
  }

  void funcForAllCategories() {
    NavigationService().navigateToScreen(
      MyRoutes.allCategoriesRoute,
      navArgs: AllCategoryModel(
          index: selectedIndex,
          categoriesMovieList: categoriesMovieList,
          choiceChipsList: choiceChipsList),
    );
  }

  void funcForAllTopRated() {
    NavigationService().navigateToScreen(
      MyRoutes.allTopRatedRoute,
      navArgs: topRatedMoviesList,
    );
  }
}
