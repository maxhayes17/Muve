import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/views/AppScaffold.dart';
import 'package:muve_application/views/CreatePage.dart';
import 'package:muve_application/views/ExplorePage.dart';
import 'package:muve_application/views/HomePage.dart';
import 'package:muve_application/views/LibraryPage.dart';
import 'package:muve_application/views/SharePage.dart';
import 'package:muve_application/views/LoginPage.dart';

const loginPath = '/';
const homePath = '/home';
const explorePath = '/explore';
const createPath = '/create';
const sharePath = '/share';
const libraryPath = '/library';

GoRouter generateRouter() {
  return GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const LoginPage(),
    ),
    ShellRoute(
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return AppScaffold(body: child);
        },
        routes: <RouteBase>[
          GoRoute(path: '/home', builder: (context, state) => const HomePage()),
          GoRoute(
              path: '/explore',
              builder: (context, state) => const ExplorePage()),
          GoRoute(
              path: '/create', builder: (context, state) => const CreatePage()),
          GoRoute(
              path: '/share', builder: (context, state) => const SharePage()),
          GoRoute(
              path: '/library',
              builder: (context, state) => const LibraryPage()),
        ])
  ]);
}
