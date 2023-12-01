import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:muve_application/widgets/horizontal_routine_list.dart';
import 'package:muve_application/widgets/vertical_routine_list.dart';
import 'package:provider/provider.dart';
import 'package:muve_application/routes.dart' as routes;

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.watch<UserViewModel>();
    userVM.getRecentRoutines();

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Center(
                  child: SizedBox(
                    width: 80,
                    child: Image.asset('assets/Muve_logo_sm.png'),
                  )
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                children: [
                  Text(
                  "Welcome back, ${userVM.user?.username}",
                    style: const TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold)
                  ),
                  const Spacer(),
                  // IconButton(
                  //   icon: const Icon(Icons.settings_outlined, color: Colors.white70,),
                  //   onPressed: () => context.push(routes.settingsPath),
                  // ),
                  IconButton(
                    icon: const Icon(Icons.logout, color: Colors.white70,),
                    onPressed: () {
                      userVM.logout();
                      context.go(routes.loginPath);
                    },
                  
                  )
                  ]
                ),
                const SizedBox(height: 32,),
                const Text(
                  "Recent Routines",
                    style: TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.bold)
                  ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: VerticalRoutineList(
                    routines: userVM.recentRoutines),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Text(
                  "Recommended Routines",
                    style: TextStyle(
                      fontSize: 28, 
                      fontWeight: FontWeight.bold)
                  ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: 190,
                child: HorizontalRoutineList(
                    routines: userVM.recommendedRoutines,
                ),
                )
              ]
            ),
      )
    );
  }
}
