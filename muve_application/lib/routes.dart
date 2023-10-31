import 'package:go_router/go_router.dart';
import 'package:muve_application/views/add_exercise_page.dart';
import 'package:muve_application/widgets/navbar.dart';
import 'package:muve_application/views/login_page.dart';
import 'package:muve_application/views/routine_page.dart';

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
