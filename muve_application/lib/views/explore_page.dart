import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/widgets/vertical_routine_list.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.watch<RoutineViewModel>();
    final count = routineVM.routineSearchResults.length;

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left,
          children: [
            SizedBox(height: 24,),
            const Text("Search Routines",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 24,),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Icon(Icons.search, color: Colors.white,),
                  SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                        routineVM.searchRoutineByName(value);
                        // routineVM.searchRoutineTags(value);
                        }
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Search Routines...",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
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
                                DropdownMenuEntry(value: 'bench press', label: '0-30min'),
                                DropdownMenuEntry(value: 'bench press', label: '1-2hr'),
                                DropdownMenuEntry(value: 'bench press', label: '2+ hr'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  routineVM.searchRoutineTags(value);
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
                                DropdownMenuEntry(value: 'bench press', label: 'Beginner'),
                                DropdownMenuEntry(value: 'bench press', label: 'Advanced'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  routineVM.searchRoutineTags(value);
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
                                DropdownMenuEntry(value: 'bench press', label: 'Required'),
                                DropdownMenuEntry(value: 'bench press', label: 'Not Required'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  routineVM.searchRoutineTags(value);
                                }
                              },
                            ),
                          ),
                        ]
                      ),
                ),
            ),
            routineVM.routineSearchResults.isNotEmpty 
            ? Text("${count} Results",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
            ) : SizedBox(),
            SizedBox(height: 12,),
            Expanded(
              child: VerticalRoutineList(routines: routineVM.routineSearchResults,)
            ),
          ]
        ),
      )
    );
  }
}
