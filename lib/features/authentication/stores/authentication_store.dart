import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:synapso/core/utils/key_value_storage_service.dart';
import 'package:synapso/features/authentication/models/user_model.dart';
import 'package:synapso/features/authentication/repository/authentication_repository.dart';

part 'authentication_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthenticationStore = _AuthenticationStoreBase with _$AuthenticationStore;

abstract class _AuthenticationStoreBase with Store, ChangeNotifier {
  final _authenticationRepository = AuthenticationRepository();

  @observable
  bool isSignedIn = false;

  @action
  Future<UserModel?> logIn({required String email, required String password}) async {
    try {
      final UserModel userModel = await _authenticationRepository.logInWithEmail(
        email: email,
        password: password,
      );

      GetIt.I.get<KeyValueStorageService>().setUserModel(userModel);

      isSignedIn = true;
      notifyListeners();
      return userModel;
    } catch (e) {
      return null;
    }
  }

  @action
  Future<UserModel?> signUp({
    required String name,
    required String surname,
    required String mobileNumber,
    required String gender,
    required String dateOfBirth,
    required String email,
    required String password,
    required int question1,
    required int question2,
    required int question3,
  }) async {
    try {
      final UserModel userModel = await _authenticationRepository.signUp(
        name: name,
        surname: surname,
        mobileNumber: mobileNumber,
        gender: gender,
        dateOfBirth: dateOfBirth,
        email: email,
        password: password,
        question1: question1,
        question2: question2,
        question3: question3,
      );

      GetIt.I.get<KeyValueStorageService>().setUserModel(userModel);
      return userModel;
    } catch (e) {
      return null;
    }
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
