// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageStore on _HomeStore, Store {
  late final _$isLoadedAtom =
      Atom(name: '_HomeStore.isLoaded', context: context);

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
    });
  }

  late final _$selectedIndexAtom =
      Atom(name: '_HomeStore.selectedIndex', context: context);

  @override
  int get selectedIndex {
    _$selectedIndexAtom.reportRead();
    return super.selectedIndex;
  }

  @override
  set selectedIndex(int value) {
    _$selectedIndexAtom.reportWrite(value, super.selectedIndex, () {
      super.selectedIndex = value;
    });
  }

  late final _$homeErrorAtom =
      Atom(name: '_HomeStore.homeError', context: context);

  @override
  String get homeError {
    _$homeErrorAtom.reportRead();
    return super.homeError;
  }

  @override
  set homeError(String value) {
    _$homeErrorAtom.reportWrite(value, super.homeError, () {
      super.homeError = value;
    });
  }

  late final _$trendingErrorAtom =
      Atom(name: '_HomeStore.trendingError', context: context);

  @override
  String get trendingError {
    _$trendingErrorAtom.reportRead();
    return super.trendingError;
  }

  @override
  set trendingError(String value) {
    _$trendingErrorAtom.reportWrite(value, super.trendingError, () {
      super.trendingError = value;
    });
  }

  late final _$choiceErrorAtom =
      Atom(name: '_HomeStore.choiceError', context: context);

  @override
  String get choiceError {
    _$choiceErrorAtom.reportRead();
    return super.choiceError;
  }

  @override
  set choiceError(String value) {
    _$choiceErrorAtom.reportWrite(value, super.choiceError, () {
      super.choiceError = value;
    });
  }

  late final _$categoryErrorAtom =
      Atom(name: '_HomeStore.categoryError', context: context);

  @override
  String get categoryError {
    _$categoryErrorAtom.reportRead();
    return super.categoryError;
  }

  @override
  set categoryError(String value) {
    _$categoryErrorAtom.reportWrite(value, super.categoryError, () {
      super.categoryError = value;
    });
  }

  late final _$topRatedErrorAtom =
      Atom(name: '_HomeStore.topRatedError', context: context);

  @override
  String get topRatedError {
    _$topRatedErrorAtom.reportRead();
    return super.topRatedError;
  }

  @override
  set topRatedError(String value) {
    _$topRatedErrorAtom.reportWrite(value, super.topRatedError, () {
      super.topRatedError = value;
    });
  }

  late final _$upcomingErrorAtom =
      Atom(name: '_HomeStore.upcomingError', context: context);

  @override
  String get upcomingError {
    _$upcomingErrorAtom.reportRead();
    return super.upcomingError;
  }

  @override
  set upcomingError(String value) {
    _$upcomingErrorAtom.reportWrite(value, super.upcomingError, () {
      super.upcomingError = value;
    });
  }

  late final _$searchErrorAtom =
      Atom(name: '_HomeStore.searchError', context: context);

  @override
  String get searchError {
    _$searchErrorAtom.reportRead();
    return super.searchError;
  }

  @override
  set searchError(String value) {
    _$searchErrorAtom.reportWrite(value, super.searchError, () {
      super.searchError = value;
    });
  }

  late final _$trendingMoviesListAtom =
      Atom(name: '_HomeStore.trendingMoviesList', context: context);

  @override
  List<TrendingMoviesModel> get trendingMoviesList {
    _$trendingMoviesListAtom.reportRead();
    return super.trendingMoviesList;
  }

  @override
  set trendingMoviesList(List<TrendingMoviesModel> value) {
    _$trendingMoviesListAtom.reportWrite(value, super.trendingMoviesList, () {
      super.trendingMoviesList = value;
    });
  }

  late final _$choiceChipsListAtom =
      Atom(name: '_HomeStore.choiceChipsList', context: context);

  @override
  List<ChoiceChipsModel> get choiceChipsList {
    _$choiceChipsListAtom.reportRead();
    return super.choiceChipsList;
  }

  @override
  set choiceChipsList(List<ChoiceChipsModel> value) {
    _$choiceChipsListAtom.reportWrite(value, super.choiceChipsList, () {
      super.choiceChipsList = value;
    });
  }

  late final _$categoriesMovieListAtom =
      Atom(name: '_HomeStore.categoriesMovieList', context: context);

  @override
  List<CategoryMoviesModel> get categoriesMovieList {
    _$categoriesMovieListAtom.reportRead();
    return super.categoriesMovieList;
  }

  @override
  set categoriesMovieList(List<CategoryMoviesModel> value) {
    _$categoriesMovieListAtom.reportWrite(value, super.categoriesMovieList, () {
      super.categoriesMovieList = value;
    });
  }

  late final _$topRatedMoviesListAtom =
      Atom(name: '_HomeStore.topRatedMoviesList', context: context);

  @override
  List<TopRatedMoviesModel> get topRatedMoviesList {
    _$topRatedMoviesListAtom.reportRead();
    return super.topRatedMoviesList;
  }

  @override
  set topRatedMoviesList(List<TopRatedMoviesModel> value) {
    _$topRatedMoviesListAtom.reportWrite(value, super.topRatedMoviesList, () {
      super.topRatedMoviesList = value;
    });
  }

  late final _$upcomingMoviesListAtom =
      Atom(name: '_HomeStore.upcomingMoviesList', context: context);

  @override
  List<UpcomingMoviesModel> get upcomingMoviesList {
    _$upcomingMoviesListAtom.reportRead();
    return super.upcomingMoviesList;
  }

  @override
  set upcomingMoviesList(List<UpcomingMoviesModel> value) {
    _$upcomingMoviesListAtom.reportWrite(value, super.upcomingMoviesList, () {
      super.upcomingMoviesList = value;
    });
  }

  @override
  String toString() {
    return '''
isLoaded: ${isLoaded},
selectedIndex: ${selectedIndex},
homeError: ${homeError},
trendingError: ${trendingError},
choiceError: ${choiceError},
categoryError: ${categoryError},
topRatedError: ${topRatedError},
upcomingError: ${upcomingError},
searchError: ${searchError},
trendingMoviesList: ${trendingMoviesList},
choiceChipsList: ${choiceChipsList},
categoriesMovieList: ${categoriesMovieList},
topRatedMoviesList: ${topRatedMoviesList},
upcomingMoviesList: ${upcomingMoviesList}
    ''';
  }
}
