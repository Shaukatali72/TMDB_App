import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:url_launcher/url_launcher.dart';

import '/routes/navigation_service.dart';
import '/routes/routes.dart';
import '../../api_services/repository.dart';
import '../../components/custom_classes/custom_exceptions.dart';
import '../../models/cast/cast_model.dart';
import '../../models/movie_arguments/movie_arguments_model.dart';
import '../../models/movie_images/movie_images_model.dart';
import '../../models/movie_trailers/movie_trailers_model.dart';
import '../../models/recommended_movies/recommended_movies_model.dart';
import '../../utils/asset_images.dart';
import '../../utils/strings.dart';

part 'details_screen_store.g.dart';

class DetailsPageStore = _DetailsStore with _$DetailsPageStore;

abstract class _DetailsStore with Store {
  final MovieArguments movieIdData;

  _DetailsStore({required this.movieIdData}) {
    getCastData();
    getMovieImages();
    getTrailersData();
    getRecommendedImages();
  }

  final widgetKey = GlobalKey();

  @observable
  late bool isLoaded = false;

  @observable
  String castError = AppStrings.blankString;

  @observable
  String movieImageError = AppStrings.blankString;

  @observable
  String trailersError = AppStrings.blankString;

  @observable
  String recommendedError = AppStrings.blankString;

  @observable
  List<CastModel> castList = [];

  @observable
  List<MovieImagesModel> movieImagesList = [];

  @observable
  List<MovieTrailersModel> movieTrailersList = [];

  @observable
  List<RecommendedMoviesModel> recommendedList = [];

  void navArgsForCast(
    CastModel castIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.castDetailsRoute,
      navArgs: CastModel(
        id: castIndex.id,
        castName: castIndex.castName,
        castImage: castIndex.castImage,
        castMovieImage: movieIdData.url,
        hero: 'cast$index',
      ),
    );
  }

  void navArgsForRecommended(
    RecommendedMoviesModel recommendedIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: recommendedIndex.backgroundImage,
        title: recommendedIndex.movieTitle,
        desc: recommendedIndex.movieDescription,
        rating: recommendedIndex.rating,
        hero: 'recommended$index',
        movieId: recommendedIndex.id,
      ),
    );
  }

  Future<void> getCastData() async {
    try {
      final result = await Repository().fetchCastData(
        movieNumber: movieIdData.movieId,
      );
      if (result.isEmpty) {
        castError = AppStrings.txtForNoMovieFound;
      } else {
        castList = result;
        isLoaded = true;
      }
    } on CustomException catch (e) {
      castError = e.customText;
    }
  }

  Future<void> getMovieImages() async {
    try {
      final result = await Repository().fetchMovieImages(
        movieImage: movieIdData.movieId,
      );
      if (result.isEmpty) {
        movieImageError = AppStrings.txtForNoMovieFound;
      } else {
        movieImagesList = result;
        isLoaded = true;
      }
    } on CustomException catch (e) {
      movieImageError = e.customText;
    }
  }

  Future<void> getTrailersData() async {
    try {
      final result = await Repository().fetchMovieTrailers(
        movieId: movieIdData.movieId,
      );
      if (result.isEmpty) {
        trailersError = AppStrings.txtForNoMovieFound;
      } else {
        movieTrailersList = result;
        isLoaded = true;
      }
    } on CustomException catch (e) {
      trailersError = e.customText;
    }
  }

  Future<void> getRecommendedImages() async {
    try {
      final result = await Repository().fetchRecommendationImages(
        movieId: movieIdData.movieId,
        pageNumber: 1,
      );
      if (result.isEmpty) {
        recommendedError = AppStrings.txtForNoMovieFound;
      } else {
        recommendedList = result;
        isLoaded = true;
      }
    } on CustomException catch (e) {
      recommendedError = e.customText;
    }
  }

  void showMovie(int data) {
    Uri uri = Uri.parse(
      '${AppUrl.staticLauncherLink}${movieTrailersList[data].movieTrailer}',
    );
    launchUrlForTrailer(uri);
  }

  Future<void> launchUrlForTrailer(Uri url) async {
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(
          url,
        );
      } else {
        throw '${AppStrings.txtForCouldNotLaunchUrl}$url';
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
