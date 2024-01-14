// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourites_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FavouritesScreenStore on _FavouritesStore, Store {
  late final _$isFavouriteAtom =
      Atom(name: '_FavouritesStore.isFavourite', context: context);

  @override
  bool get isFavourite {
    _$isFavouriteAtom.reportRead();
    return super.isFavourite;
  }

  @override
  set isFavourite(bool value) {
    _$isFavouriteAtom.reportWrite(value, super.isFavourite, () {
      super.isFavourite = value;
    });
  }

  @override
  String toString() {
    return '''
isFavourite: ${isFavourite}
    ''';
  }
}
