import 'package:flutter/material.dart';
import 'package:muve_application/models/routine_model.dart';

class ComposeForm extends StatefulWidget {
  final Routine? routine;
  const ComposeForm({super.key, required this.routine});

  @override
  State<ComposeForm> createState() => _ComposeFormState();
}

class _ComposeFormState extends State<ComposeForm> {
  final TextEditingController _routineNameController = TextEditingController();
  final TextEditingController _routineDurationController = TextEditingController();
  late Routine? routine;

  @override
  void initState() {
    super.initState();
    routine = widget.routine;
    _routineNameController.addListener(() {
      routine?.name = _routineNameController.text;
    });
    _routineDurationController.addListener(() {
      routine?.duration = _routineDurationController.text;
    });
  }

  // @override
  // void dispose() {
  //   _routineDurationController.dispose();
  //   _routineDurationController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(hintText: "Name"),
          controller: _routineNameController,
        ),
        // TextFormField(
        //   decoration: const InputDecoration(hintText: "Duration"),
        //   controller: _routineDurationController,
        // )
      ],
    );
  }
}
