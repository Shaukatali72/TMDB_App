// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services_chopper.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$MyChopper extends MyChopper {
  _$MyChopper([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MyChopper;

  @override
  Future<Response<dynamic>> getCast(
    String apiKey,
    int movieNumber,
  ) {
    final Uri $url =
        Uri.parse('https://api.themoviedb.org/3/movie/${movieNumber}/credits');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCastDetails(
    String apiKey,
    int castId,
  ) {
    final Uri $url = Uri.parse('https://api.themoviedb.org/3/person/${castId}');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getMovieImages(
    String apiKey,
    int movieId,
  ) {
    final Uri $url =
        Uri.parse('https://api.themoviedb.org/3/movie/${movieId}/images');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getMovieTrailers(
    String apiKey,
    int movieId,
  ) {
    final Uri $url =
        Uri.parse('https://api.themoviedb.org/3/movie/${movieId}/videos');
    final Map<String, dynamic> $params = <String, dynamic>{'api_key': apiKey};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getRecommendationImages(
    String apiKey,
    int movieId,
    int pageNumber,
  ) {
    final Uri $url = Uri.parse(
        'https://api.themoviedb.org/3/movie/${movieId}/recommendations');
    final Map<String, dynamic> $params = <String, dynamic>{
      'api_key': apiKey,
      'page': pageNumber,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
