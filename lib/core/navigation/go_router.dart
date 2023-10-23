import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/authentication/presentation/screens/change_password_page.dart';
import 'package:synapso/features/authentication/presentation/screens/enter_code_page.dart';
import 'package:synapso/features/authentication/presentation/screens/log_in_page.dart';
import 'package:synapso/features/authentication/presentation/screens/recover_password_page.dart';
import 'package:synapso/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:synapso/features/authentication/presentation/screens/welcome_page.dart';
import 'package:synapso/features/authentication/stores/authentication_store.dart';
import 'package:synapso/features/main_page.dart';

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  refreshListenable: GetIt.I<AuthenticationStore>(),
  redirect: (context, state) {
    final authStore = GetIt.I<AuthenticationStore>();
    if (authStore.isSignedIn) {
      return null;
    } else if (state.fullPath == '/login' ||
        state.fullPath == '/sign_up' ||
        state.fullPath == '/recover_password' ||
        state.fullPath == '/welcome_page' ||
        state.fullPath == '/enter_code' ||
        state.fullPath == '/change_password') {
      return null;
    } else {
      return '/welcome_page';
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const MainPage(),
    ),
    GoRoute(
      path: '/welcome_page',
      builder: (BuildContext context, GoRouterState state) => const WelcomePage(),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) => const LogInPage(),
    ),
    GoRoute(
      path: '/sign_up',
      builder: (BuildContext context, GoRouterState state) => const SignUpPage(),
    ),
    GoRoute(
      path: '/recover_password',
      builder: (BuildContext context, GoRouterState state) => const RecoverPasswordPage(),
    ),
    GoRoute(
      path: '/enter_code',
      builder: (BuildContext context, GoRouterState state) => const EnterCodePage(),
    ),
    GoRoute(
      path: '/change_password',
      builder: (BuildContext context, GoRouterState state) => const ChangePasswordPage(),
    ),
  ],
);
