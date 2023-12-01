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
  late int? selected;

  @override
  void initState() {
    super.initState();
    final userVM = context.read<UserViewModel>();
    selected = (userVM.routines!.length - 1);
  }

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
              const Spacer(),
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white10),
                  child: const Icon(
                    Icons.add_link_outlined,
                    size: 40,
                  ),
                ),
                onTap: () {
                  routineVM.saveToClipboard();
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Copied to clipboard")));
                },
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white10),
                  child: const Icon(
                    Icons.sms_outlined,
                    size: 30,
                  ),
                ),
                onTap: () => routineVM.sendSMS(),
              ),
            ]),
            const Text("Select routine",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: SingleChildScrollView(
                  child: ListView.builder(
                      shrinkWrap: true,
                      reverse: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // Disable ListView scrolling
                      itemCount: userVM.routines?.length,
                      itemBuilder: (context, index) {
                        final routine = userVM.routines?[index];
                        return GestureDetector(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color:
                                    index == selected ? Colors.white10 : null,
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
            ),
          ],
        ),
      ),
    );
  }
}
