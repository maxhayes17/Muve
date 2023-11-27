import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:muve_application/widgets/horizontal_routine_list.dart';
import 'package:muve_application/widgets/vertical_routine_list.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.watch<UserViewModel>();

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32, right: 32),
          child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align text to the left
              children: [
                Center(
                  child: Container(
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
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold)
                  ),
                  Spacer(),
                  Icon(Icons.settings_outlined, color: Colors.white70,),
                  SizedBox(width: 10,),
                  Icon(Icons.logout, color: Colors.white70,)
                  ]
                ),
                SizedBox(height: 32,),
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
                    routines: userVM.getRecentRoutines()),
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
                Container(
                  height: 200,
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
