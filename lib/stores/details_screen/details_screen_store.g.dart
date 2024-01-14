// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DetailsPageStore on _DetailsStore, Store {
  late final _$isLoadedAtom =
      Atom(name: '_DetailsStore.isLoaded', context: context);

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

  late final _$castErrorAtom =
      Atom(name: '_DetailsStore.castError', context: context);

  @override
  String get castError {
    _$castErrorAtom.reportRead();
    return super.castError;
  }

  @override
  set castError(String value) {
    _$castErrorAtom.reportWrite(value, super.castError, () {
      super.castError = value;
    });
  }

  late final _$movieImageErrorAtom =
      Atom(name: '_DetailsStore.movieImageError', context: context);

  @override
  String get movieImageError {
    _$movieImageErrorAtom.reportRead();
    return super.movieImageError;
  }

  @override
  set movieImageError(String value) {
    _$movieImageErrorAtom.reportWrite(value, super.movieImageError, () {
      super.movieImageError = value;
    });
  }

  late final _$trailersErrorAtom =
      Atom(name: '_DetailsStore.trailersError', context: context);

  @override
  String get trailersError {
    _$trailersErrorAtom.reportRead();
    return super.trailersError;
  }

  @override
  set trailersError(String value) {
    _$trailersErrorAtom.reportWrite(value, super.trailersError, () {
      super.trailersError = value;
    });
  }

  late final _$recommendedErrorAtom =
      Atom(name: '_DetailsStore.recommendedError', context: context);

  @override
  String get recommendedError {
    _$recommendedErrorAtom.reportRead();
    return super.recommendedError;
  }

  @override
  set recommendedError(String value) {
    _$recommendedErrorAtom.reportWrite(value, super.recommendedError, () {
      super.recommendedError = value;
    });
  }

  late final _$castListAtom =
      Atom(name: '_DetailsStore.castList', context: context);

  @override
  List<CastModel> get castList {
    _$castListAtom.reportRead();
    return super.castList;
  }

  @override
  set castList(List<CastModel> value) {
    _$castListAtom.reportWrite(value, super.castList, () {
      super.castList = value;
    });
  }

  late final _$movieImagesListAtom =
      Atom(name: '_DetailsStore.movieImagesList', context: context);

  @override
  List<MovieImagesModel> get movieImagesList {
    _$movieImagesListAtom.reportRead();
    return super.movieImagesList;
  }

  @override
  set movieImagesList(List<MovieImagesModel> value) {
    _$movieImagesListAtom.reportWrite(value, super.movieImagesList, () {
      super.movieImagesList = value;
    });
  }

  late final _$movieTrailersListAtom =
      Atom(name: '_DetailsStore.movieTrailersList', context: context);

  @override
  List<MovieTrailersModel> get movieTrailersList {
    _$movieTrailersListAtom.reportRead();
    return super.movieTrailersList;
  }

  @override
  set movieTrailersList(List<MovieTrailersModel> value) {
    _$movieTrailersListAtom.reportWrite(value, super.movieTrailersList, () {
      super.movieTrailersList = value;
    });
  }

  late final _$recommendedListAtom =
      Atom(name: '_DetailsStore.recommendedList', context: context);

  @override
  List<RecommendedMoviesModel> get recommendedList {
    _$recommendedListAtom.reportRead();
    return super.recommendedList;
  }

  @override
  set recommendedList(List<RecommendedMoviesModel> value) {
    _$recommendedListAtom.reportWrite(value, super.recommendedList, () {
      super.recommendedList = value;
    });
  }

  @override
  String toString() {
    return '''
isLoaded: ${isLoaded},
castError: ${castError},
movieImageError: ${movieImageError},
trailersError: ${trailersError},
recommendedError: ${recommendedError},
castList: ${castList},
movieImagesList: ${movieImagesList},
movieTrailersList: ${movieTrailersList},
recommendedList: ${recommendedList}
    ''';
  }
}
