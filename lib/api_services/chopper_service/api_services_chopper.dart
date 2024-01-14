import 'package:chopper/chopper.dart';

part 'api_services_chopper.chopper.dart';

@ChopperApi(baseUrl: 'https://api.themoviedb.org/3/')
abstract class MyChopper extends ChopperService {
  static MyChopper create([ChopperClient? client]) => _$MyChopper(client);

  @Get(path: 'movie/{movie_id}/credits')
  Future<Response> getCast(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieNumber,
  );

  @Get(path: 'person/{cast_id}')
  Future<Response> getCastDetails(
    @Query('api_key') String apiKey,
    @Path('cast_id') int castId,
  );

  @Get(path: 'movie/{file_path}/images')
  Future<Response> getMovieImages(
    @Query('api_key') String apiKey,
    @Path('file_path') int movieId,
  );

  @Get(path: 'movie/{movie_id}/videos')
  Future<Response> getMovieTrailers(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieId,
  );

  @Get(path: 'movie/{movie_id}/recommendations')
  Future<Response> getRecommendationImages(
    @Query('api_key') String apiKey,
    @Path('movie_id') int movieId,
    @Query('page') int pageNumber,
  );
}
