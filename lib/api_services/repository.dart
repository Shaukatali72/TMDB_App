import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:dio/dio.dart';

import '../components/custom_classes/custom_exceptions.dart';
import '../components/custom_classes/custom_handler_chopper.dart';
import '../models/cast/cast_model.dart';
import '../models/cast_details/cast_details_model.dart';
import '../models/category_movies/category_movies_model.dart';
import '../models/choice_chips/choice_chips_model.dart';
import '../models/movie_images/movie_images_model.dart';
import '../models/movie_trailers/movie_trailers_model.dart';
import '../models/recommended_movies/recommended_movies_model.dart';
import '../models/search_movies/search_movies_model.dart';
import '../models/top_rated_movies/top_rated_movies_model.dart';
import '../models/trending_movies/trending_movies_model.dart';
import '../models/upcoming_movies/upcoming_movies_model.dart';
import '../utils/strings.dart';
import 'chopper_service/api_services_chopper.dart';
import 'loggers/chopper_logger_interceptors.dart';
import 'loggers/retrofit_logger_interceptors.dart';
import 'retrofit_service/api_services_retrofit.dart';

class Repository {
  static final Repository _instance = Repository._internal();
  Repository._internal();
  factory Repository() => _instance;

  final dioClient = Dio()..interceptors.add(LoggingInterceptor());
  late final client = RetroServices(dioClient);

  final myChopperService = MyChopper.create(
    ChopperClient(
      converter: const JsonConverter(),
      interceptors: [ChopperLogger()],
    ),
  );

  CustomException retrofitExceptions(DioException exception) {
    switch (exception.type) {
      case DioExceptionType.connectionError:
        return CustomException(AppStrings.txtForConnectingToServer);
      case DioExceptionType.connectionTimeout:
        return CustomException(AppStrings.txtForSlowInternetConnection);
      case DioExceptionType.sendTimeout:
        return CustomException(AppStrings.txtForSlowInternetConnection);
      case DioExceptionType.receiveTimeout:
        return CustomException(AppStrings.txtForServerDown);
      case DioExceptionType.badResponse:
        if (exception.type == DioExceptionType.connectionError) {
          return CustomException(AppStrings.txtForNoInternet);
        } else if (exception.response!.statusCode == 401) {
          return CustomException(AppStrings.txtForInvalidApiKey);
        } else if (exception.response!.statusCode == 404) {
          return CustomException(AppStrings.txtForNoMovieFound);
        } else if (exception.response!.statusCode == 402) {
          return CustomException(AppStrings.txtForServiceNotAvailable);
        } else {
          return CustomException(AppStrings.txtForTryAgain);
        }
      case DioExceptionType.cancel:
        return CustomException(AppStrings.txtForRequestCanceled);
      case DioExceptionType.unknown:
        return exception.error is SocketException
            ? CustomException(AppStrings.txtForNoInternet)
            : CustomException(AppStrings.txtForSomethingWentWrong);
      case DioExceptionType.badCertificate:
        return CustomException(AppStrings.txtForServiceBlocked);
    }
  }

  CustomException chopperExceptions(int statusCode) {
    if (statusCode == 401) {
      return CustomException(AppStrings.txtForInvalidApiKey);
    } else if (statusCode == 404) {
      return CustomException(AppStrings.txtForNoMovieFound);
    } else if (statusCode == 402) {
      return CustomException(AppStrings.txtForServiceNotAvailable);
    } else {
      return CustomException(AppStrings.txtForTryAgain);
    }
  }

  Future<List<TrendingMoviesModel>> fetchTrendingMoviesData() async {
    try {
      final response = await client.getTrendingMovies(AppStrings.api_key);
      return response.results;
    } catch (e) {
      if (e is DioException) {
        throw retrofitExceptions(e);
      }
      throw CustomException(AppStrings.txtForSomethingWentWrong);
    }
  }

  Future<List<ChoiceChipsModel>> fetchChoiceChipsData() async {
    try {
      final response = await client.getGenres(AppStrings.api_key);
      return response.genres;
    } catch (e) {
      if (e is DioException) {
        throw retrofitExceptions(e);
      }
      throw CustomException(AppStrings.txtForSomethingWentWrong);
    }
  }

  Future<List<CategoryMoviesModel>> fetchCategoryMoviesData({
    required int withGenres,
    required int pageNumber,
    required bool isAdult,
  }) async {
    try {
      final response = await client.getCategoryMovies(
        AppStrings.api_key,
        withGenres,
        pageNumber,
        isAdult,
      );
      return response.results;
    } catch (e) {
      if (e is DioException) {
        throw retrofitExceptions(e);
      }
      throw CustomException(AppStrings.txtForSomethingWentWrong);
    }
  }

  Future<List<TopRatedMoviesModel>> fetchTopRatedMoviesData({
    required int pageNumber,
  }) async {
    try {
      final response = await client.getTopRatedMovies(
        AppStrings.api_key,
        pageNumber,
      );
      return response.results;
    } catch (e) {
      if (e is DioException) {
        throw retrofitExceptions(e);
      }
      throw CustomException(AppStrings.txtForSomethingWentWrong);
    }
  }

  Future<List<UpcomingMoviesModel>> fetchUpcomingMoviesData({
    required int pageNumber,
  }) async {
    try {
      final response = await client.getUpcomingMovies(
        AppStrings.api_key,
        pageNumber,
      );
      return response.results;
    } catch (e) {
      if (e is DioException) {
        throw retrofitExceptions(e);
      }
      throw CustomException(AppStrings.txtForSomethingWentWrong);
    }
  }

  Future<List<SearchMoviesModel>> fetchSearchedMoviesData({
    required String searchMovie,
    required bool isAdult,
    required int pageNumber,
  }) async {
    try {
      final response = await client.getSearchedMovies(
        AppStrings.api_key,
        searchMovie,
        isAdult,
        pageNumber,
      );
      return response.results;
    } catch (e) {
      if (e is DioException) {
        throw retrofitExceptions(e);
      }
      throw CustomException(AppStrings.txtForSomethingWentWrong);
    }
  }

  Future<List<CastModel>> fetchCastData({
    required int movieNumber,
  }) async {
    try {
      final response =
          await myChopperService.getCast(AppStrings.api_key, movieNumber);
      if (response.statusCode == 200) {
        return response.body['cast']
            .map<CastModel>((e) => CastModel.fromJson(e))
            .toList();
      } else {
        throw chopperExceptions(response.statusCode);
      }
    } catch (e) {
      throw CustomHandler(e);
    }
  }

  Future<CastDetailsModel> fetchCastDetails({
    required int castId,
  }) async {
    try {
      final response =
          await myChopperService.getCastDetails(AppStrings.api_key, castId);
      if (response.statusCode == 200) {
        return CastDetailsModel.fromJson(response.body);
      } else {
        throw chopperExceptions(response.statusCode);
      }
    } catch (e) {
      throw CustomHandler(e);
    }
  }

  Future<List<MovieImagesModel>> fetchMovieImages({
    required int movieImage,
  }) async {
    try {
      final response =
          await myChopperService.getMovieImages(AppStrings.api_key, movieImage);
      if (response.statusCode == 200) {
        return response.body['backdrops']
            .map<MovieImagesModel>((e) => MovieImagesModel.fromJson(e))
            .toList();
      } else {
        throw chopperExceptions(response.statusCode);
      }
    } catch (e) {
      throw CustomHandler(e);
    }
  }

  Future<List<MovieTrailersModel>> fetchMovieTrailers({
    required int movieId,
  }) async {
    try {
      final response =
          await myChopperService.getMovieTrailers(AppStrings.api_key, movieId);
      if (response.statusCode == 200) {
        return response.body['results']
            .map<MovieTrailersModel>((e) => MovieTrailersModel.fromJson(e))
            .toList();
      } else {
        throw chopperExceptions(response.statusCode);
      }
    } catch (e) {
      throw CustomHandler(e);
    }
  }

  Future<List<RecommendedMoviesModel>> fetchRecommendationImages({
    required int movieId,
    required int pageNumber,
  }) async {
    try {
      final response = await myChopperService.getRecommendationImages(
          AppStrings.api_key, movieId, pageNumber);

      if (response.statusCode == 200) {
        return response.body['results']
            .map<RecommendedMoviesModel>(
                (e) => RecommendedMoviesModel.fromJson(e))
            .toList();
      } else {
        throw chopperExceptions(response.statusCode);
      }
    } catch (e) {
      throw CustomHandler(e);
    }
  }
}
