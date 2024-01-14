// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileStore on _ProfileStore, Store {
  late final _$imageFileAtom =
      Atom(name: '_ProfileStore.imageFile', context: context);

  @override
  File? get imageFile {
    _$imageFileAtom.reportRead();
    return super.imageFile;
  }

  @override
  set imageFile(File? value) {
    _$imageFileAtom.reportWrite(value, super.imageFile, () {
      super.imageFile = value;
    });
  }

  late final _$userValueAtom =
      Atom(name: '_ProfileStore.userValue', context: context);

  @override
  String get userValue {
    _$userValueAtom.reportRead();
    return super.userValue;
  }

  @override
  set userValue(String value) {
    _$userValueAtom.reportWrite(value, super.userValue, () {
      super.userValue = value;
    });
  }

  late final _$emailValueAtom =
      Atom(name: '_ProfileStore.emailValue', context: context);

  @override
  String get emailValue {
    _$emailValueAtom.reportRead();
    return super.emailValue;
  }

  @override
  set emailValue(String value) {
    _$emailValueAtom.reportWrite(value, super.emailValue, () {
      super.emailValue = value;
    });
  }

  @override
  String toString() {
    return '''
imageFile: ${imageFile},
userValue: ${userValue},
emailValue: ${emailValue}
    ''';
  }
}
