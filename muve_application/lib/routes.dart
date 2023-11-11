import 'package:go_router/go_router.dart';
import 'package:muve_application/views/add_exercise_page.dart';
import 'package:muve_application/views/add_music_page.dart';
import 'package:muve_application/widgets/navbar.dart';
import 'package:muve_application/views/login_page.dart';
import 'package:muve_application/views/routine_page.dart';

const loginPath = '/login';
const homePath = '/home';
const explorePath = '/explore';
const composePath = '/compose';
const sharePath = '/share';
const libraryPath = '/library';
const addExercisePath = '/add_exercise/';
const addMusicPath = '/add_music/';
const routinePath = '/routine/';

GoRouter generateRouter() {
  return GoRouter(initialLocation: '/login', routes: [
    GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
    GoRoute(
        path: '/home',
        builder: (context, state) => const NavScaffold(index: 0)),
    GoRoute(
        path: '/explore',
        builder: (context, state) => const NavScaffold(index: 1)),
    GoRoute(
        path: '/compose',
        builder: (context, state) => const NavScaffold(index: 2)),
    GoRoute(
        path: '/share',
        builder: (context, state) => const NavScaffold(index: 3)),
    GoRoute(
        path: '/library',
        builder: (context, state) => const NavScaffold(index: 4)),
    GoRoute(
        path: '/add_exercise/:id',
        builder: (context, state) => AddExercisePage(id: int.parse(state.pathParameters['id']!))),
    GoRoute(
        path: '/add_music/:id', builder: (context, state) => AddMusicPage(id: int.parse(state.pathParameters['id']!))),
    GoRoute(
        path: '/routine/:id',
        builder: (context, state) =>
            RoutinePage(id: int.parse(state.pathParameters['id']!)))
  ]);
}
