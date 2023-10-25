import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/authentication/presentation/screens/change_password_page.dart';
import 'package:synapso/features/authentication/presentation/screens/enter_code_page.dart';
import 'package:synapso/features/authentication/presentation/screens/log_in_page.dart';
import 'package:synapso/features/authentication/presentation/screens/recover_password_page.dart';
import 'package:synapso/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:synapso/features/authentication/presentation/screens/welcome_page.dart';
import 'package:synapso/features/authentication/stores/authentication_store.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter goRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
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
      redirect: (context, state) => '/home',
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldWithNavBar(child: child);
      },
      routes: [
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) => const Scaffold(
            body: Center(
              child: Text('asdf'),
            ),
          ),
        ),
        GoRoute(
          path: '/profile',
          builder: (BuildContext context, GoRouterState state) => const Scaffold(
            body: Center(
              child: Text('asdf'),
            ),
          ),
        ),
      ],
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

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.shadow,
              blurRadius: 12,
              offset: const Offset(0, 0),
              spreadRadius: 0,
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        height: 81.h,
        child: BottomNavigationBar(
          currentIndex: _calculateSelectedIndex(context),
          onTap: (int index) => _onItemTapped(index, context),
          iconSize: 32.h,
          items: const [
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/home.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: ImageIcon(
                AssetImage('assets/icons/profile.png'),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/profile')) {
      return 1;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/home');
        break;
      case 1:
        GoRouter.of(context).go('/profile');
        break;
    }
  }
}
