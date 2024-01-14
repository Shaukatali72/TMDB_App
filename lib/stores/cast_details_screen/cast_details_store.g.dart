// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CastDetailsStore on _CastDetailsStore, Store {
  late final _$bioDataAtom =
      Atom(name: '_CastDetailsStore.bioData', context: context);

  @override
  CastDetailsModel get bioData {
    _$bioDataAtom.reportRead();
    return super.bioData;
  }

  @override
  set bioData(CastDetailsModel value) {
    _$bioDataAtom.reportWrite(value, super.bioData, () {
      super.bioData = value;
    });
  }

  late final _$castDetailsErrorAtom =
      Atom(name: '_CastDetailsStore.castDetailsError', context: context);

  @override
  String get castDetailsError {
    _$castDetailsErrorAtom.reportRead();
    return super.castDetailsError;
  }

  @override
  set castDetailsError(String value) {
    _$castDetailsErrorAtom.reportWrite(value, super.castDetailsError, () {
      super.castDetailsError = value;
    });
  }

  @override
  String toString() {
    return '''
bioData: ${bioData},
castDetailsError: ${castDetailsError}
    ''';
  }
}
