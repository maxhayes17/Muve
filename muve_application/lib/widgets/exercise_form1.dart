// import 'package:flutter/material.dart';
// import 'package:form_validator/form_validator.dart';
// import 'package:go_router/go_router.dart';
// import 'package:muve_application/models/exercise_model.dart';
// import 'package:muve_application/routes.dart' as routes;
// import 'package:muve_application/viewmodels/compose_view_model.dart';
// import 'package:muve_application/widgets/exercise_form_element.dart';
// import 'package:provider/provider.dart';

// class ExerciseForm extends StatefulWidget {
//   const ExerciseForm({super.key});

//   @override
//   State<ExerciseForm> createState() => _ExerciseFormState();
// }

// class _ExerciseFormState extends State<ExerciseForm> {
//   @override
//   Widget build(BuildContext context) {

//     final composeVM = context.watch<ComposeViewModel>();

//     return Container(
//       width: MediaQuery.of(context).size.width,
//       height: MediaQuery.of(context).size.height * 0.7,
//       // color: Colors.red,
//       child: Column(
//         children: [
//           Text('${composeVM.newRoutine.exercises?.length}'),
//           Expanded(
//             child: ListView.builder(
//               itemCount: composeVM.newRoutine.exercises?.length,
//               itemBuilder: (context, index) {
//                 Exercise? exercise = composeVM.newRoutine.exercises?[index];
//                 return Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: ExerciseFormElement(index: index,)
//                   );
//               }),
//           ),
//           SizedBox(
//             width: MediaQuery.of(context).size.width * 0.8,
//             height: 50,
//             child: FilledButton(
//               onPressed: () => composeVM.addExercise(),
//               child: const Text(
//                 "Add Exercise",
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }