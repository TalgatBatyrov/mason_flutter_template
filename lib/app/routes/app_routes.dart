import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:test_app/app/app.dart';
import 'package:test_app/app/routes/app_navigation.dart';

@module
abstract class AppRoutes {
  @singleton
  GoRouter provideGoRouter() => GoRouter(
        initialLocation: AppNavigation.root,
        routes: [
          GoRoute(
            path: AppNavigation.root,
            builder: (BuildContext context, GoRouterState state) {
              return const Home();
            },
          ),
        ],
      );
}
