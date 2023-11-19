import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:provider/provider.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final routineVM = context.watch<RoutineViewModel>();
    final count = routineVM.routineSearchResults.length;

    return SafeArea(
      child: Column(children: [
        const Text("Explore Page"),
        TextFormField(
          onChanged: (value) => routineVM.searchRoutineTags(value),
        ),
        Text("$count results"),
        SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: count,
              itemBuilder: ((context, index) {
                var routine = routineVM.routineSearchResults[index];
                return Text("${routine.name}, ${routine.author}");
              })),
        )
      ]),
    );
  }
}
