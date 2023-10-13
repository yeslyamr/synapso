import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/authentication/presentation/log_in_page.dart';
import 'package:synapso/features/main_page.dart';

bool isSignedIn = false;

final GoRouter goRouter = GoRouter(
  initialLocation: '/',
  redirect: (context, state) {
    if (isSignedIn) {
      return null;
    } else {
      return '/login';
    }
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const MainPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) => const LogInPage(),
    ),
  ],
);
