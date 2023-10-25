import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:synapso/core/utils/key_value_storage_service.dart';

part 'authentication_store.g.dart';

// ignore: library_private_types_in_public_api
class AuthenticationStore = _AuthenticationStoreBase with _$AuthenticationStore;

abstract class _AuthenticationStoreBase with Store, ChangeNotifier {
  @observable
  bool isSignedIn = false;

  @action
  Future<void> logIn({required String email, required String password}) async {
    GetIt.I.get<KeyValueStorageService>().setAccessToken('fake_token');
    GetIt.I.get<KeyValueStorageService>().setAuthPassword(password);
    isSignedIn = true;
    notifyListeners();
  }

  @action
  Future<void> signUp({required String email, required String password}) async {
    GetIt.I.get<KeyValueStorageService>().setAccessToken('fake_token');
    GetIt.I.get<KeyValueStorageService>().setAuthPassword(password);
    isSignedIn = true;
    notifyListeners();
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
