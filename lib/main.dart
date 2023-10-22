import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:synapso/core/utils/service_locator.dart';

import 'app.dart';
import 'features/authentication/stores/authentication_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupKeyValueStorageService();

  setupApiService();

  GetIt.I.registerSingleton<AuthenticationStore>(AuthenticationStore()..checkIfSignedIn());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) => runApp(const MyApp()));

  runApp(const MyApp());
}
