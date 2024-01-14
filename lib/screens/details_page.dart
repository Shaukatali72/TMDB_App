import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '/utils/asset_images.dart';
import '/utils/colors.dart';
import '/utils/strings.dart';
import '../components/cast.dart';
import '../components/loaders/shimmer_loader_casts.dart';
import '../components/loaders/shimmer_loader_horizontal.dart';
import '../components/movie_images.dart';
import '../components/recommended_movies.dart';
import '../components/trailers.dart';
import '../models/movie_arguments/movie_arguments_model.dart';
import '../routes/navigation_service.dart';
import '../stores/details_screen/details_screen_store.dart';
import '../stores/favourites_screen/favourites_store.dart';
import '../utils/reusable_widgets.dart';

class DetailsPage extends StatelessWidget {
  final MovieArguments movieArgs;

  const DetailsPage({
    super.key,
    required this.movieArgs,
  });

  @override
  Widget build(BuildContext context) {
    final _dataForDetail = context.read<DetailsPageStore>();
    final _dataForFavourites = context.read<FavouritesScreenStore>();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: NavigationService().popIt,
          icon: const Icon(
            Icons.chevron_left,
            size: 60,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () => _dataForFavourites.isOnClicked(movieArgs),
              icon: Observer(
                builder: (_) {
                  return _dataForFavourites.isFavourite
                      // icon: context
                      //         .read<FavouritesScreenStore>()
                      //         .favouritesListIndex
                      //         .contains(movieArgs.title)
                      ? SvgPicture.asset(
                          AppIcons.iconForFilledHeart,
                          colorFilter: const ColorFilter.mode(
                            AppColors.red,
                            BlendMode.srcIn,
                          ),
                        )
                      : SvgPicture.asset(
                          AppIcons.iconForHeart,
                          colorFilter: const ColorFilter.mode(
                            AppColors.white,
                            BlendMode.srcIn,
                          ),
                        );
                },
              ),
              iconSize: 40,
            ),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Hero(
            tag: movieArgs.hero,
            child: CachedNetworkImage(
              imageUrl: '${AppUrl.apiImageLink}${movieArgs.url}',
              errorWidget: (_, __, ___) {
                return const ErrorImageHandler(
                  dynamicSize: Size(
                    100,
                    100,
                  ),
                );
              },
              fit: BoxFit.cover,
            ),
          ),
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.white,
                  AppColors.white.withOpacity(0.0),
                  AppColors.white.withOpacity(0.0),
                ],
                stops: const [
                  0.3,
                  0.6,
                  0.0,
                ],
              ).createShader(rect);
            },
            blendMode: BlendMode.dstOut,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.homePageColor,
                    AppColors.homePageColor,
                  ],
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.only(
              top: 300,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movieArgs.title,
                        style: const TextStyle(
                          color: AppColors.white,
                          fontSize: 40,
                        ),
                      ),
                      const SizedBox(height: 25),
                      SizedBox(
                        height: 100,
                        width: 340,
                        child: Wrap(
                          children: [
                            Text(
                              movieArgs.desc,
                              style: const TextStyle(
                                color: AppColors.white,
                                fontSize: 15,
                              ),
                              maxLines: 5,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 45,
                            child: ElevatedButton.icon(
                              onPressed: () => Scrollable.ensureVisible(
                                _dataForDetail.widgetKey.currentContext!,
                                duration: const Duration(milliseconds: 1000),
                              ),
                              icon: SvgPicture.asset(
                                AppIcons.iconForPlay,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.black,
                                  BlendMode.srcIn,
                                ),
                                width: 15,
                              ),
                              label: const Text(
                                AppStrings.txtForBtnPlayNow,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontSize: 18,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: AppColors.primaryColor,
                              ),
                            ),
                          ),
                          const SizedBox(width: 120),
                          SvgPicture.asset(
                            AppIcons.iconForStar,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              AppColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Text(
                            movieArgs.rating.toString(),
                            style: const TextStyle(
                              color: AppColors.white,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const Text(
                        AppStrings.txtForCast,
                        style: TextStyle(
                          color: AppColors.white,
                          fontSize: 35,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) {
                    if (_dataForDetail.castError.isEmpty) {
                      return _dataForDetail.isLoaded
                          ? const Cast()
                          : const ShimmerLoaderCasts();
                    } else {
                      return ErrorMessage(errorData: _dataForDetail.castError);
                    }
                  },
                ),
                Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_dataForDetail.movieImagesList.isNotEmpty) ...[
                          const Padding(
                            padding: EdgeInsets.only(left: 29),
                            child: Text(
                              AppStrings.txtForMovieImages,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Observer(
                            builder: (_) {
                              if (_dataForDetail.movieImageError.isEmpty) {
                                return _dataForDetail.isLoaded
                                    ? const MovieImages()
                                    : const ShimmerLoaderHorizontal();
                              } else {
                                return ErrorMessage(
                                    errorData: _dataForDetail.movieImageError);
                              }
                            },
                          ),
                        ]
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_dataForDetail.movieTrailersList.isNotEmpty) ...[
                          const Padding(
                            padding: EdgeInsets.only(left: 29),
                            child: Text(
                              AppStrings.txtForMovieTrailers,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Observer(
                            builder: (_) {
                              if (_dataForDetail.trailersError.isEmpty) {
                                return _dataForDetail.isLoaded
                                    ? MovieTrailers(
                                        key: _dataForDetail.widgetKey,
                                      )
                                    : const ShimmerLoaderHorizontal();
                              } else {
                                return ErrorMessage(
                                    errorData: _dataForDetail.trailersError);
                              }
                            },
                          ),
                        ]
                      ],
                    );
                  },
                ),
                const SizedBox(height: 20),
                Observer(
                  builder: (_) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (_dataForDetail.recommendedList.isNotEmpty) ...[
                          const Padding(
                            padding: EdgeInsets.only(left: 29),
                            child: Text(
                              AppStrings.txtForRecommended,
                              style: TextStyle(
                                color: AppColors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Observer(
                            builder: (_) {
                              return _dataForDetail.isLoaded
                                  ? const RecommendedMovies()
                                  : const ShimmerLoaderHorizontal();
                            },
                          ),
                          const SizedBox(height: 40),
                        ]
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
