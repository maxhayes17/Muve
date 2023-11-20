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
            SizedBox(height: 24,),
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
