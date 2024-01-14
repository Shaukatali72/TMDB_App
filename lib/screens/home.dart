import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/components/top_rated_movies.dart';
import '/components/trending_movies.dart';
import '/utils/asset_images.dart';
import '/utils/colors.dart';
import '/utils/strings.dart';
import '../components/category_movies.dart';
import '../components/loaders/shimmer_loader_horizontal.dart';
import '../components/loaders/shimmer_loader_top_rated.dart';
import '../components/upcoming_movies.dart';
import '../stores/home_screen/home_store.dart';
import '../utils/reusable_widgets.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final _dataForHome = context.read<HomePageStore>();

    return Scaffold(
      backgroundColor: AppColors.homePageColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leadingWidth: 70,
        title: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppIcons.iconForLogoAppBar,
                fit: BoxFit.contain,
                height: 45,
                colorFilter: const ColorFilter.mode(
                  AppColors.primaryColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (_dataForHome.homeError.isEmpty) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                      top: 40,
                    ),
                    child: Text(
                      AppStrings.txtForHPTrendingMovies,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Observer(
                    builder: (_) {
                      if (_dataForHome.trendingError.isEmpty) {
                        return _dataForHome.isLoaded
                            ? const TrendingMovies()
                            : const ShimmerLoaderHorizontal();
                      } else {
                        return ErrorMessage(
                          errorData: _dataForHome.trendingError,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, right: 20),
                    child: Row(
                      children: [
                        const Text(
                          AppStrings.txtForCategory,
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 30,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: _dataForHome.funcForAllCategories,
                          child: const Text(
                            AppStrings.txtForSeeAll,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) {
                      if (_dataForHome.choiceError.isEmpty) {
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: Wrap(
                              spacing: 3,
                              direction: Axis.horizontal,
                              children: _dataForHome.choiceChips(),
                            ),
                          ),
                        );
                      } else {
                        return ErrorMessage(
                          errorData: _dataForHome.choiceError,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  Observer(
                    builder: (_) {
                      if (_dataForHome.categoryError.isEmpty) {
                        return _dataForHome.isLoaded
                            ? const CategoryMovies()
                            : const ShimmerLoaderHorizontal();
                      } else {
                        return ErrorMessage(
                          errorData: _dataForHome.categoryError,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 20,
                    ),
                    child: Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                            top: 10,
                          ),
                          child: Text(
                            AppStrings.txtForTopRated,
                            style: TextStyle(
                              color: AppColors.white,
                              fontSize: 30,
                            ),
                          ),
                        ),
                        const SizedBox(width: 7),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Icon(
                            Icons.star,
                            color: AppColors.primaryColor,
                            size: 30,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: _dataForHome.funcForAllTopRated,
                          child: const Text(
                            AppStrings.txtForSeeAll,
                            style: TextStyle(
                              fontSize: 20,
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) {
                      if (_dataForHome.topRatedError.isEmpty) {
                        return _dataForHome.isLoaded
                            ? const TopRatedMovies()
                            : const ShimmerLoaderTopRated();
                      } else {
                        return ErrorMessage(
                          errorData: _dataForHome.topRatedError,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(left: 30),
                    child: Text(
                      AppStrings.txtForUpcomingMovies,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Observer(
                    builder: (_) {
                      if (_dataForHome.upcomingError.isEmpty) {
                        return _dataForHome.isLoaded
                            ? const UpcomingMovies()
                            : const ShimmerLoaderHorizontal();
                      } else {
                        return ErrorMessage(
                          errorData: _dataForHome.upcomingError,
                        );
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            );
          } else {
            return ErrorMessage(
              errorData: _dataForHome.homeError,
            );
          }
        },
      ),
    );
  }
}
