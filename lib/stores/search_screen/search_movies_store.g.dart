// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_movies_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SearchMoviesStore on _SearchStore, Store {
  late final _$searchErrorAtom =
      Atom(name: '_SearchStore.searchError', context: context);

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

  late final _$searchMoviesListAtom =
      Atom(name: '_SearchStore.searchMoviesList', context: context);

  @override
  List<SearchMoviesModel> get searchMoviesList {
    _$searchMoviesListAtom.reportRead();
    return super.searchMoviesList;
  }

  @override
  set searchMoviesList(List<SearchMoviesModel> value) {
    _$searchMoviesListAtom.reportWrite(value, super.searchMoviesList, () {
      super.searchMoviesList = value;
    });
  }

  @override
  String toString() {
    return '''
searchError: ${searchError},
searchMoviesList: ${searchMoviesList}
    ''';
  }
}
