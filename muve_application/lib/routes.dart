import 'package:go_router/go_router.dart';
import 'package:muve_application/views/AddExercisePage.dart';
import 'package:muve_application/views/NavScaffold.dart';
import 'package:muve_application/views/LoginPage.dart';

const loginPath = '/login';
const navBarPath = '/nav_scaffold';
const addExercisePath = '/add_exercise';

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
      builder: (context, state) => const AddExercise(),
    )
  ]);
}
