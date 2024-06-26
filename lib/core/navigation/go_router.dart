import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:synapso/features/authentication/presentation/screens/new_password_page.dart';
import 'package:synapso/features/authentication/presentation/screens/enter_code_page.dart';
import 'package:synapso/features/authentication/presentation/screens/log_in_page.dart';
import 'package:synapso/features/authentication/presentation/screens/recover_password_page.dart';
import 'package:synapso/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:synapso/features/authentication/presentation/screens/welcome_page.dart';
import 'package:synapso/features/authentication/stores/authentication_store.dart';
import 'package:synapso/features/collins/models/collins_model.dart';
import 'package:synapso/features/collins/presentation/screens/collins_page.dart';
import 'package:synapso/features/distraction/presentation/pages/distraction_page.dart';
import 'package:synapso/features/experiments_list/presentation/experiments_list_page.dart';
import 'package:synapso/features/experiments_list/stores/experiments_list_store.dart';
import 'package:synapso/features/my_experiments/presentation/pages/my_experiments_list_page.dart';
import 'package:synapso/features/my_experiments/store/my_experiments_list_store.dart';
import 'package:synapso/features/profile/presentation/screens/change_password_page.dart';
import 'package:synapso/features/profile/presentation/screens/profile_page.dart';
import 'package:synapso/features/recall_task/models/recall_task_model.dart';
import 'package:synapso/features/recall_task/presentation/screens/recall_task_presentation_page.dart';
import 'package:synapso/features/recall_task/presentation/screens/recall_task_recall_page.dart';
import 'package:synapso/features/recognition_task/models/recognition_task_model.dart';
import 'package:synapso/features/recognition_task/presentation/screens/recognition_task_presentation_page.dart';
import 'package:synapso/features/recognition_task/presentation/screens/recognition_task_recall_page.dart';

import '../../features/profile/presentation/screens/personal_data_page.dart';

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
        state.fullPath == '/new_password') {
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
    StatefulShellRoute.indexedStack(
      // navigatorKey: _shellNavigatorKey,
      builder: (context, state, navigationShell) {
        return ScaffoldWithNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (BuildContext context, GoRouterState state) => Provider<ExperimentsListStore>(
                create: (_) => ExperimentsListStore(),
                child: const ExperimentsListPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/my_experiments',
              builder: (BuildContext context, GoRouterState state) => Provider<MyExperimentsListStore>(
                create: (_) => MyExperimentsListStore(),
                child: const MyExperimentsListPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (BuildContext context, GoRouterState state) => const ProfilePage(),
              routes: [
                GoRoute(
                  path: 'change_password',
                  name: 'change_password',
                  builder: (context, state) => const ChangePasswordPage(),
                ),
                GoRoute(
                  path: 'personal_data',
                  name: 'personal_data',
                  builder: (context, state) => const PersonalDataPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/recall_task_presentation',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => RecallTaskPresentationPage(
        model: state.extra as RecallTaskModel,
      ),
    ),
    GoRoute(
      path: '/distraction/:extype',
      builder: (BuildContext context, GoRouterState state) {
        final extype = state.pathParameters['extype'];
        if (extype == 'recall') {
          final model = state.extra as RecallTaskModel;
          return DistractionPage(
            experimentType: 'recall',
            distractionType: model.distractionType,
            distractionText: model.distractionText,
            distractionDuration: model.distractionDuration,
            model: model,
          );
        } else {
          final model = state.extra as RecognitionTaskModel;
          return DistractionPage(
            experimentType: 'recognition',
            distractionType: model.distractionType,
            distractionText: model.distractionText,
            distractionDuration: model.distractionDuration,
            model: model,
          );
        }
      },
    ),
    GoRoute(
      path: '/collins',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => CollinsPage(
        collinsModel: state.extra as CollinsModel,
      ),
    ),
    GoRoute(
      path: '/recall_task_recall',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => RecallTaskRecallPage(
        model: state.extra as RecallTaskModel,
      ),
    ),
    GoRoute(
      path: '/recognition_task_presentation',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) => RecognitionTaskPresentationPage(
        recognitionTaskModel: state.extra as RecognitionTaskModel,
      ),
    ),
    GoRoute(
      path: '/recognition_task_recall',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (BuildContext context, GoRouterState state) => RecognitionTaskRecallPage(
        recognitionTaskModel: state.extra as RecognitionTaskModel,
      ),
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
      path: '/new_password',
      builder: (BuildContext context, GoRouterState state) => const NewPasswordPage(),
    ),
  ],
);

class ScaffoldWithNavBar extends StatelessWidget {
  const ScaffoldWithNavBar({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
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
                AssetImage('assets/icons/my_experiments.png'),
              ),
              label: 'My experiments',
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
    if (location.startsWith('/my_experiments')) {
      return 1;
    }
    if (location.startsWith('/profile')) {
      return 2;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
