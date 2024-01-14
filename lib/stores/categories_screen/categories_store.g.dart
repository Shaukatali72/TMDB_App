// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CategoriesStore on _CategoriesStore, Store {
  late final _$categoryDataListAtom =
      Atom(name: '_CategoriesStore.categoryDataList', context: context);

  @override
  List<CategoryMoviesModel> get categoryDataList {
    _$categoryDataListAtom.reportRead();
    return super.categoryDataList;
  }

  @override
  set categoryDataList(List<CategoryMoviesModel> value) {
    _$categoryDataListAtom.reportWrite(value, super.categoryDataList, () {
      super.categoryDataList = value;
    });
  }

  @override
  String toString() {
    return '''
categoryDataList: ${categoryDataList}
    ''';
  }
}
