import 'package:awesome_extensions/awesome_extensions.dart' hide NavigatorExt;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:synapso/features/authentication/presentation/screens/new_password_page.dart';
import 'package:synapso/features/authentication/presentation/screens/enter_code_page.dart';
import 'package:synapso/features/authentication/presentation/screens/log_in_page.dart';
import 'package:synapso/features/authentication/presentation/screens/recover_password_page.dart';
import 'package:synapso/features/authentication/presentation/screens/sign_up_page.dart';
import 'package:synapso/features/authentication/presentation/screens/welcome_page.dart';
import 'package:synapso/features/authentication/stores/authentication_store.dart';
import 'package:synapso/features/profile/presentation/screens/change_password_page.dart';
import 'package:synapso/features/profile/presentation/screens/profile_page.dart';
import 'package:synapso/features/recall_task/models/recall_task_model.dart';
import 'package:synapso/features/recall_task/presentation/screens/recall_task_presentation_page.dart';
import 'package:synapso/features/recall_task/presentation/screens/recall_task_recall_page.dart';

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
              builder: (BuildContext context, GoRouterState state) => SafeArea(
                child: Scaffold(
                  body: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _rootNavigatorKey.currentContext?.push(
                            '/recall_task_presentation',
                            extra: const RecallTaskModel(
                              stimulus: Stimulus(
                                type: 'words',
                                stimuli: [
                                  StimulusElement(data: 'duck', delay: 1000, cue: 'donald'),
                                  StimulusElement(data: 'zebra', delay: 1000, cue: 'madagaskar'),
                                  StimulusElement(data: 'panda', delay: 1000, cue: 'kung fu'),
                                  StimulusElement(data: 'silverback', delay: 200, cue: 'joe rogan'),
                                  StimulusElement(data: 'horse', delay: 1000, cue: 'kazakhstan'),
                                  StimulusElement(data: 'cat', delay: 1000, cue: 'garfield'),
                                  StimulusElement(data: 'mouse', delay: 1000, cue: 'mickey'),
                                  StimulusElement(data: 'ant', delay: 1000, cue: 'marvel'),
                                  StimulusElement(data: 'pigeon', delay: 3000, cue: 'new york'),
                                ],
                              ),
                              isSequenceMatter: true,
                              isFreeRecall: false,
                            ),
                          );
                        },
                        child: const Text('with cues and NOT free recall'),
                      ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
                      ElevatedButton(
                        onPressed: () {
                          _rootNavigatorKey.currentContext?.push(
                            '/recall_task_presentation',
                            extra: const RecallTaskModel(
                              stimulus: Stimulus(
                                type: 'words',
                                stimuli: [
                                  StimulusElement(data: 'duck', delay: 500, cue: 'donald'),
                                  StimulusElement(data: 'zebra', delay: 500, cue: 'madagaskar'),
                                  StimulusElement(data: 'panda', delay: 500, cue: 'kung fu'),
                                  // StimulusElement(data: 'silverback', delay: 200, cue: 'joe rogan'),
                                  // StimulusElement(data: 'horse', delay: 1000, cue: 'kazakhstan'),
                                  // StimulusElement(data: 'cat', delay: 1000, cue: 'garfield'),
                                  // StimulusElement(data: 'mouse', delay: 1000, cue: 'mickey'),
                                  // StimulusElement(data: 'ant', delay: 1000, cue: 'marvel'),
                                  // StimulusElement(data: 'pigeon', delay: 3000, cue: 'new york'),
                                ],
                              ),
                              isSequenceMatter: true,
                              isFreeRecall: true,
                            ),
                          );
                        },
                        child: const Text('recall task: with cues and free recall'),
                      ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
                      ElevatedButton(
                        onPressed: () {
                          _rootNavigatorKey.currentContext?.push(
                            '/recall_task_presentation',
                            extra: const RecallTaskModel(
                              stimulus: Stimulus(
                                type: 'words',
                                stimuli: [
                                  StimulusElement(data: 'duck', delay: 500, cue: null),
                                  StimulusElement(data: 'zebra', delay: 500, cue: null),
                                  StimulusElement(data: 'panda', delay: 500, cue: null),
                                  // StimulusElement(data: 'silverback', delay: 200, cue: null),
                                  // StimulusElement(data: 'horse', delay: 1000, cue: null),
                                  // StimulusElement(data: 'cat', delay: 1000, cue: null),
                                  // StimulusElement(data: 'mouse', delay: 1000, cue: null),
                                  // StimulusElement(data: 'ant', delay: 1000, cue: null),
                                  // StimulusElement(data: 'pigeon', delay: 3000, cue: null),
                                ],
                              ),
                              isSequenceMatter: false,
                              isFreeRecall: true,
                            ),
                          );
                        },
                        child: const Text('without cues and free recall and sequence does NOT matter'),
                      ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
                      ElevatedButton(
                        onPressed: () {
                          _rootNavigatorKey.currentContext?.push(
                            '/recall_task_presentation',
                            extra: const RecallTaskModel(
                              stimulus: Stimulus(
                                type: 'words',
                                stimuli: [
                                  StimulusElement(data: 'duck', delay: 500, cue: null),
                                  StimulusElement(data: 'zebra', delay: 500, cue: null),
                                  StimulusElement(data: 'panda', delay: 500, cue: null),
                                  // StimulusElement(data: 'silverback', delay: 200, cue: null),
                                  // StimulusElement(data: 'horse', delay: 1000, cue: null),
                                  // StimulusElement(data: 'cat', delay: 1000, cue: null),
                                  // StimulusElement(data: 'mouse', delay: 1000, cue: null),
                                  // StimulusElement(data: 'ant', delay: 1000, cue: null),
                                  // StimulusElement(data: 'pigeon', delay: 3000, cue: null),
                                ],
                              ),
                              isSequenceMatter: true,
                              isFreeRecall: true,
                            ),
                          );
                        },
                        child: const Text('without cues and free recall and sequence matter'),
                      ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
                      ElevatedButton(
                        onPressed: () {
                          _rootNavigatorKey.currentContext?.push(
                            '/recall_task_presentation',
                            extra: const RecallTaskModel(
                              stimulus: Stimulus(
                                type: 'words',
                                stimuli: [
                                  StimulusElement(data: 'duck', delay: 500, cue: null),
                                  StimulusElement(data: 'zebra', delay: 500, cue: null),
                                  StimulusElement(data: 'panda', delay: 500, cue: null),
                                  // StimulusElement(data: 'silverback', delay: 200, cue: null),
                                  // StimulusElement(data: 'horse', delay: 1000, cue: null),
                                  // StimulusElement(data: 'cat', delay: 1000, cue: null),
                                  // StimulusElement(data: 'mouse', delay: 1000, cue: null),
                                  // StimulusElement(data: 'ant', delay: 1000, cue: null),
                                  // StimulusElement(data: 'pigeon', delay: 3000, cue: null),
                                ],
                              ),
                              isSequenceMatter: true,
                              isFreeRecall: false,
                            ),
                          );
                        },
                        child: const Text('without cues and NOT free recall and sequence matter'),
                      ).paddingSymmetric(horizontal: 16.w, vertical: 8.h),
                    ],
                  ),
                ),
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
      path: '/recall_task_recall',
      parentNavigatorKey: _rootNavigatorKey,
      builder: (context, state) => RecallTaskRecallPage(
        model: state.extra as RecallTaskModel,
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
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
