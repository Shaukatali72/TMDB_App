class UpcomingMoviesModel {
  final int id;
  final String movieImage;
  final String backgroundImage;
  final String movieTitle;
  final String movieDescription;
  final double rating;

  UpcomingMoviesModel({
    required this.id,
    required this.movieImage,
    required this.backgroundImage,
    required this.movieTitle,
    required this.movieDescription,
    required this.rating,
  });

  factory UpcomingMoviesModel.fromJson(Map<String, dynamic> json) {
    return UpcomingMoviesModel(
      id: json['id'] as int,
      movieImage: json['backdrop_path'] as String,
      backgroundImage: json['poster_path'] as String,
      movieTitle: json['title'] as String,
      movieDescription: json['overview'] as String,
      rating: (json['vote_average'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'backdrop_path': movieImage,
      'poster_path': backgroundImage,
      'title': movieTitle,
      'overview': movieDescription,
      'vote_average': rating,
    };
  }
}
