import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../presentation/pan_verification_failed_screen/pan_verification_failed_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String initial = '/';
  static const String panVerificationFailedScreen =
      '/pan-verification-failed-screen';
}

CustomTransitionPage<void> _fadePage(GoRouterState state, Widget child) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 280),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        child: child,
      );
    },
  );
}

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.initial,
  routes: [
    GoRoute(
      path: AppRoutes.initial,
      pageBuilder: (context, state) =>
          _fadePage(state, const PanVerificationFailedScreen()),
    ),
    GoRoute(
      path: AppRoutes.panVerificationFailedScreen,
      pageBuilder: (context, state) =>
          _fadePage(state, const PanVerificationFailedScreen()),
    ),
  ],
);
