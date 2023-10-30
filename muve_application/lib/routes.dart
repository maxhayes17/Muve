import 'package:go_router/go_router.dart';
import 'package:muve_application/views/appbar/AddExercisePage.dart';
import 'package:muve_application/views/NavScaffold.dart';
import 'package:muve_application/views/LoginPage.dart';
import 'package:muve_application/views/appbar/RoutinePage.dart';

const loginPath = '/login';
const navBarPath = '/nav_scaffold';
const addExercisePath = '/add_exercise';
const routinePath = '/routine';

GoRouter generateRouter() {
  return GoRouter(initialLocation: '/login', routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: '/nav_scaffold',
      builder: (context, state) => const NavScaffold(),
    ),
    GoRoute(
      path: '/add_exercise',
      builder: (context, state) => const AddExercisePage(),
    ),
    GoRoute(path: '/routine', builder: (context, state) => const RoutinePage())
  ]);
}
