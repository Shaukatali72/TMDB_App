import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../response_classes/category_movies/category_movies_response.dart';
import '../../response_classes/genres/genres_response.dart';
import '../../response_classes/search_movies/search_movies_response.dart';
import '../../response_classes/top_rated_movies/top_rated_movies_response.dart';
import '../../response_classes/trending_movies/trending_movies_response.dart';
import '../../response_classes/upcoming_movies/upcoming_movies_response.dart';

part 'api_services_retrofit.g.dart';

@RestApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class RetroServices {
  factory RetroServices(Dio dio) = _RetroServices;

  @GET('trending/movie/day')
  Future<ResponseForTrendingMovies> getTrendingMovies(
    @Query('api_key') String apiKey,
  );

  @GET('genre/movie/list')
  Future<ResponseForGenres> getGenres(
    @Query('api_key') String apiKey,
  );

  @GET('discover/movie')
  Future<ResponseForCategoryMovies> getCategoryMovies(
    @Query('api_key') String apiKey,
    @Query('with_genres') int withGenres,
    @Query('page') int pageNumberForCategories,
    @Query('include_adult') bool isAdult,
  );

  @GET('movie/top_rated')
  Future<ResponseForTopRatedMovies> getTopRatedMovies(
    @Query('api_key') String apiKey,
    @Query('page') int pageNumberForTopRated,
  );

  @GET('movie/upcoming')
  Future<ResponseForUpcomingMovies> getUpcomingMovies(
    @Query('api_key') String apiKey,
    @Query('page') int pageNumberForUpcomingMovies,
  );

  @GET('search/movie')
  Future<ResponseForSearchMovies> getSearchedMovies(
    @Query('api_key') String apiKey,
    @Query('query') String searchMovie,
    @Query('include_adult') bool isAdult,
    @Query('page') int pageNumberForSearch,
  );
}
