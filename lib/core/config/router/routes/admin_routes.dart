import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_template/core/config/router/route_observer.dart';
import 'package:flutter_template/core/utils/transitions/custom_transitions.dart';
import 'package:go_router/go_router.dart';

import '../../../../features/features_screens.dart';
import '../../../../features/shared/presentation/layouts/admin_layout.dart';

final adminNavigationKey = GlobalKey<NavigatorState>(debugLabel: 'AdminNavigator');

class AdminNavigator{

  static routes (Ref ref) =>  ShellRoute(
     observers: [
      GoRouterObserver(ref: ref),
    ],
    navigatorKey: adminNavigationKey,
     pageBuilder: (context, state, child) {
      return PageTransitions.buildPageWithFadeAndSlideTransition(
        state: state,
        context: context,
        child: AdminLayout(child: child)
      );
    },
    routes: [
      GoRoute(
        path: ReleasesScreen.path,
        name: ReleasesScreen.path,
        builder: (_,__) => ReleasesScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeAndSlideTransition(
            state: state,
            context: context,
            child: const ReleasesScreen()
          );
        },
      ),
      GoRoute(
        path: FeaturesPlannedFuncionlitiesScreen.path,
        name: FeaturesPlannedFuncionlitiesScreen.path,
        builder: (_,__) => FeaturesPlannedFuncionlitiesScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeAndSlideTransition(
            state: state,
            context: context,
            child: const FeaturesPlannedFuncionlitiesScreen()
          );
        },
      ),
      GoRoute(
        path: FeaturesUnderConsiderationScreen.path,
        name: FeaturesUnderConsiderationScreen.path,
        builder: (_,__) => FeaturesUnderConsiderationScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeAndSlideTransition(
            state: state,
            context: context,
            child: const FeaturesUnderConsiderationScreen()
          );
        },
      ),
      GoRoute(
        path: FeaturesSendYourIdeasScreen.path,
        name: FeaturesSendYourIdeasScreen.path,
        builder: (_,__) => FeaturesSendYourIdeasScreen(),
        pageBuilder: (context, state) {
          return PageTransitions.buildPageWithFadeAndSlideTransition(
            state: state,
            context: context,
            child: const FeaturesSendYourIdeasScreen()
          );
        },
      ),
    ]
  );

}
