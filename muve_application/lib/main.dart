import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/viewmodels/explore_view_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';
import 'package:muve_application/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // loadFakeDataRoutines();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserViewModel>(
          create: (context) => UserViewModel()),
      ChangeNotifierProvider<RoutineViewModel>(
          create: (context) => RoutineViewModel()),
      ChangeNotifierProvider<ComposeViewModel>(
          create: (context) => ComposeViewModel()),
      ChangeNotifierProvider<ExploreViewModel>(
          create: (context) => ExploreViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Muve',
        theme: ThemeData.dark(useMaterial3: true),
        routerConfig: generateRouter());
  }
}

// void loadFakeDataRoutines() async {
//   final db = FirebaseFirestore.instance;
//   for (var routine in routines) {
//     //add to Firestore db
//     var routineId = routine.id.toString();
//     final docRef = db
//         .collection("routines")
//         .withConverter(
//           fromFirestore: Routine.fromFirestore,
//           toFirestore: (Routine routine, options) => routine.toFirestore(),
//         )
//         .doc(routineId);
//     await docRef.set(routine);
//   }
// }
