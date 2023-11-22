import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/compose_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

class ComposePage extends StatelessWidget {
  const ComposePage({super.key});

  @override
  Widget build(BuildContext context) {
    final userVM = context.read<UserViewModel>();
    final currentUser = userVM.user;
    // final userId = userVM.id;
    final composeVM = context.watch<ComposeViewModel>();
    if (composeVM.newRoutine == null){
      composeVM.createRoutine(currentUser);
    }
    // Routine? newRoutine = composeVM.newRoutine;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24,),
            const Text("Create routine",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
            ),
            // SizedBox(height: 12,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 5,
              // color: Colors.red,
              child: Row(
                children: [
                  Container(
                    width: 128,
                    height: 128,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                      // color: Colors.blueGrey,
                    ),
                    child: composeVM.newRoutine!.picturePath != null
                        && composeVM.newRoutine!.picturePath!.isNotEmpty
                          ? Image.asset('assets/${composeVM.newRoutine!.picturePath}')
                          : Image.asset('assets/Muve_routine_logo.png'),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      Container(
                        width: 128,
                        padding: EdgeInsets.only(top: 24),
                        child: TextFormField(
                          decoration: const InputDecoration(hintText: "Name",),
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                          onChanged: (value){
                            composeVM.updateRoutineName(value);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
            SizedBox(height: 12,),
            const Text("Add tags",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 100,
              // color: Colors.grey[200],
              child: 
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.only(left:15),
                            child: DropdownMenu(
                              width: 126,
                              inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
                              label: Text("Duration"),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(value: '0-30min', label: '0-30min'),
                                DropdownMenuEntry(value: '1-2hr', label: '1-2hr'),
                                DropdownMenuEntry(value: '2+ hr', label: '2+ hr'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  composeVM.addTag(value);
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.only(left:15),
                            child: DropdownMenu(
                              width: 132,
                              label: Text("Skill level"),
                              inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(value: 'Beginner', label: 'Beginner'),
                                DropdownMenuEntry(value: 'Advanced', label: 'Advanced'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  composeVM.addTag(value);
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(10)),
                            padding: EdgeInsets.only(left:15),
                            child: DropdownMenu(
                              width: 146,
                              label: Text("Equipment"),
                              inputDecorationTheme: InputDecorationTheme(border: InputBorder.none),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(value: 'Equipment Required', label: 'Required'),
                                DropdownMenuEntry(value: 'Equipment Not Required', label: 'Not Required'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  composeVM.addTag(value);
                                }
                              },
                            ),
                          ),
                        ]
                      ),
                ),
              ),
            Divider(),
            const SizedBox(height: 32,),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.only(top:20, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[700],
                        borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Text(
                          "Add Exercises",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                        ),
                    ),
                    onTap: () => context.push(routes.addExercisePath),
                  ),
                  const SizedBox(height: 20,),
                  GestureDetector(
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.only(top:20, bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[700],
                        borderRadius: BorderRadius.circular(15)
                        ),
                        child: const Text(
                          "Add Music",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
                        ),
                      // ),
                    ),
                    onTap: () => context.push(routes.addMusicPath),
                  ),
                  SizedBox(height: 60,),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 70,
                    child: FilledButton(
                      style: FilledButton.styleFrom(backgroundColor: Colors.amber[900]),
                      onPressed: () {
                        composeVM.saveRoutine(currentUser);
                        context.push(routes.homePath);
                      },
                      child: const Text(
                        "Create routine",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ),
              ]
              ),
            ),
          ],
        ),
      )
    );
  }
}
