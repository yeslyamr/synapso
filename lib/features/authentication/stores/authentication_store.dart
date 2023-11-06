import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:synapso/core/utils/key_value_storage_service.dart';
import 'package:synapso/features/authentication/repository/authentication_repository.dart';

part 'authentication_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthenticationStore = _AuthenticationStoreBase with _$AuthenticationStore;

abstract class _AuthenticationStoreBase with Store, ChangeNotifier {
  final _authenticationRepository = AuthenticationRepository();

  @observable
  bool isSignedIn = false;

  @action
  Future<void> logIn({required String email, required String password}) async {
    try {
      // await _authenticationRepository.logInWithEmail(
      //   email: email,
      //   password: password,
      // );

      GetIt.I.get<KeyValueStorageService>().setAccessToken(
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzA4MjQ5NzYsInJvbGUiOiJzdWJqZWN0IiwidXNlcl9pZCI6MTF9.30GdBmCPVWcM1QHJ7qQerdv2U6PkNyUOGW5YMP2FOME');
      GetIt.I.get<KeyValueStorageService>().setAuthPassword(password);
      isSignedIn = true;
      notifyListeners();
    } catch (e) {}
  }

  @action
  Future<void> signUp({
    required String name,
    required String surname,
    required String mobileNumber,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
  }) async {
    try {
      await _authenticationRepository.signUp(
        name: name,
        surname: surname,
        mobileNumber: mobileNumber,
        gender: gender,
        dateOfBirth: dateOfBirth,
        email: email,
        password: password,
      );
      notifyListeners();  
    } catch (e) {}
  }

  @action
  Future<void> logOut() async {
    GetIt.I.get<KeyValueStorageService>().resetKeys();
    isSignedIn = false;
    notifyListeners();
  }

  Future<void> checkIfSignedIn() async {
    final token = await GetIt.I.get<KeyValueStorageService>().getAccessToken();
    isSignedIn = token != null;
    notifyListeners();
  }
}
