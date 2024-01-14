import 'package:mobx/mobx.dart';

import '/api_services/repository.dart';
import '../../../components/custom_classes/custom_exceptions.dart';
import '../../../models/search_movies/search_movies_model.dart';
import '../../../utils/strings.dart';
import '../../models/movie_arguments/movie_arguments_model.dart';
import '../../routes/navigation_service.dart';
import '../../routes/routes.dart';

part 'search_movies_store.g.dart';

class SearchMoviesStore = _SearchStore with _$SearchMoviesStore;

abstract class _SearchStore with Store {
  _SearchStore() {
    getSearchedMoviesData('')
        .then((_) => searchError = AppStrings.txtForSearchMovies);
  }

  void searchMovies(String enteredData) {
    getSearchedMoviesData(enteredData);
  }

  void navArgsForSearch(
    SearchMoviesModel searchIndex,
    int index,
  ) {
    NavigationService().navigateToScreen(
      MyRoutes.detailsPageRoute,
      navArgs: MovieArguments(
        url: searchIndex.searchImage,
        title: searchIndex.movieTitle,
        desc: searchIndex.movieDescription,
        rating: searchIndex.rating,
        hero: 'search$index',
        movieId: searchIndex.id,
      ),
    );
  }

  @observable
  String searchError = AppStrings.blankString;

  @observable
  List<SearchMoviesModel> searchMoviesList = [];

  Future<void> getSearchedMoviesData(String enteredData) async {
    searchError = AppStrings.blankString;
    searchMoviesList = [];
    try {
      final result = await Repository().fetchSearchedMoviesData(
        searchMovie: enteredData,
        isAdult: false,
        pageNumber: 1,
      );
      if (enteredData.isEmpty) {
        searchError = AppStrings.txtForSearchMovies;
      } else if (result.isEmpty) {
        searchMoviesList = [];
        searchError = AppStrings.txtForNoMovieFound;
      } else {
        searchMoviesList = result;
      }
    } on CustomException catch (e) {
      searchError = e.customText;
    }
  }
}
