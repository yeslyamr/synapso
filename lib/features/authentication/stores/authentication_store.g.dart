// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthenticationStore on _AuthenticationStoreBase, Store {
  late final _$isSignedInAtom =
      Atom(name: '_AuthenticationStoreBase.isSignedIn', context: context);

  @override
  bool get isSignedIn {
    _$isSignedInAtom.reportRead();
    return super.isSignedIn;
  }

  @override
  set isSignedIn(bool value) {
    _$isSignedInAtom.reportWrite(value, super.isSignedIn, () {
      super.isSignedIn = value;
    });
  }

  late final _$logInAsyncAction =
      AsyncAction('_AuthenticationStoreBase.logIn', context: context);

  @override
  Future<UserModel?> logIn({required String email, required String password}) {
    return _$logInAsyncAction
        .run(() => super.logIn(email: email, password: password));
  }

  late final _$signUpAsyncAction =
      AsyncAction('_AuthenticationStoreBase.signUp', context: context);

  @override
  Future<UserModel?> signUp(
      {required String name,
      required String surname,
      required String mobileNumber,
      required String gender,
      required String dateOfBirth,
      required String email,
      required String password,
      required int question1,
      required int question2,
      required int question3}) {
    return _$signUpAsyncAction.run(() => super.signUp(
        name: name,
        surname: surname,
        mobileNumber: mobileNumber,
        gender: gender,
        dateOfBirth: dateOfBirth,
        email: email,
        password: password,
        question1: question1,
        question2: question2,
        question3: question3));
  }

  late final _$logOutAsyncAction =
      AsyncAction('_AuthenticationStoreBase.logOut', context: context);

  @override
  Future<void> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  @override
  String toString() {
    return '''
isSignedIn: ${isSignedIn}
    ''';
  }
}
