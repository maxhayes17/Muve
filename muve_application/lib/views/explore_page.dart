import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/explore_view_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/widgets/vertical_routine_list.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final exploreVM = context.watch<ExploreViewModel>();
    final count = exploreVM.routineSearchResults.length;

    final _searchController = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left,
          children: [
            const SizedBox(height: 24,),
            const Text("Search Routines",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
            ),
            const SizedBox(height: 24,),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              padding: const EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                      color: Colors.blueGrey[800],
                      borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  const Icon(Icons.search, color: Colors.white,),
                  const SizedBox(width: 10,),
                  Expanded(
                    child: TextField(
                      controller: _searchController,
                      onSubmitted: (value) {
                        if (value.isNotEmpty) {
                        exploreVM.searchRoutineByName(value);
                        // exploreVM.searchRoutineTags(value);
                        }
                      },
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          hintText: "Search Routines...",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _searchController.clear();
                      exploreVM.clearSearchResults();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Cleared search results")));  
                    }, 
                    icon: Icon(Icons.cancel)
                  ),
                ],
              ),
            ),
            SizedBox(
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
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.only(left:15),
                            child: DropdownMenu(
                              width: 126,
                              inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
                              label: const Text("Duration"),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(value: '0-30min', label: '0-30min'),
                                DropdownMenuEntry(value: '1-2hr', label: '1-2hr'),
                                DropdownMenuEntry(value: '2+ hr', label: '2+ hr'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  exploreVM.searchRoutineTags(value);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.only(left:15),
                            child: DropdownMenu(
                              width: 132,
                              label: const Text("Skill level"),
                              inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(value: 'Beginner', label: 'Beginner'),
                                DropdownMenuEntry(value: 'Advanced', label: 'Advanced'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  exploreVM.searchRoutineTags(value);
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[800],
                              borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.only(left:15),
                            child: DropdownMenu(
                              width: 146,
                              label: const Text("Equipment"),
                              inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none),
                              dropdownMenuEntries: const [
                                DropdownMenuEntry(value: 'Equipment Required', label: 'Required'),
                                DropdownMenuEntry(value: 'Equipment Not Required', label: 'Not Required'),
                              ], 
                              onSelected: (String? value) {
                                if (value != null){
                                  exploreVM.searchRoutineTags(value);
                                }
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              exploreVM.clearSearchResults();
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Cleared search results")));  
                            }, 
                            icon: Icon(Icons.cancel)
                          ),
                        ]
                      ),
                ),
            ),
            exploreVM.routineSearchResults.isNotEmpty 
            ? Text("$count ${count == 1 ? 'Result' : 'Results'}",
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
            ) : const SizedBox(),
            const SizedBox(height: 12,),
            Expanded(
              child: VerticalRoutineList(routines: exploreVM.routineSearchResults,)
            ),
          ]
        ),
      )
    );
  }
}
