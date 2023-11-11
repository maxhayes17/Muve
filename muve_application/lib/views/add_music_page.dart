import 'package:flutter/material.dart';
import 'package:muve_application/models/exercise_model.dart';
import 'package:muve_application/models/routine_model.dart';
import 'package:muve_application/models/set_model.dart';
import 'package:muve_application/models/track_model.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:provider/provider.dart';

class AddMusicPage extends StatelessWidget {
  // final int id;

  const AddMusicPage({super.key});

  @override
  Widget build(BuildContext context) {

    final routineVM = context.read<RoutineViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Music'),
      ),
      body: const Text("Add Music Page"),
    );
  }
}
