import 'package:flutter/material.dart';
import 'package:muve_application/viewmodels/routine_view_model.dart';
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  late int selected = 0;

  @override
  Widget build(BuildContext context) {
    final userVM = context.read<UserViewModel>();
    final routineVM = context.watch<RoutineViewModel>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            const Text("Share routine",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 12,
            ),
            Row(children: [
              const Text("Method",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              IconButton(
                onPressed: () {
                  routineVM.saveToClipboard();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("copied to clipboard")));
                },
                icon: const Icon(Icons.add_link),
                iconSize: 60,
              ),
              IconButton(
                onPressed: () => routineVM.sendSMS(),
                icon: const Icon(Icons.sms_outlined),
                iconSize: 60,
              ),
            ]),
            const Text("Select routine",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 12,
            ),
            SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    physics:
                        const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                    itemCount: userVM.routines?.length,
                    itemBuilder: (context, index) {
                      final routine = userVM.routines?[index];
                      return GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              border: index == selected
                                  ? Border.all(color: Colors.white)
                                  : null,
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.height / 12,
                                  height:
                                      MediaQuery.of(context).size.height / 12,
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                    // color: Colors.blueGrey,
                                  ),
                                  child: routine!.picturePath != null &&
                                          routine.picturePath!.isNotEmpty
                                      ? Image.asset(
                                          'assets/${routine.picturePath}')
                                      : Image.asset(
                                          'assets/Muve_routine_logo.png'),
                                ),
                                const SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment
                                      .start, // Align text to the left
                                  children: [
                                    Text(routine.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16)),
                                    // Text(routine!.duration),
                                    Text(routine.author),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            routineVM.setRoutineById(routine.id);
                            setState(() {
                              selected = index;
                            });
                          });
                    })),
          ],
        ),
      ),
    );
  }
}
