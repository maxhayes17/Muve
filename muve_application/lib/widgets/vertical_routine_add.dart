import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;

class VerticalRoutineAdd extends StatelessWidget {
  const VerticalRoutineAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Container(
          padding: const EdgeInsets.only(top: 10, bottom: 10),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.height / 12,
                height: MediaQuery.of(context).size.height / 12,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    color: Colors.white10,
                  ),
                  child: const Icon(Icons.library_add, size: 50 ,color: Colors.white70,),
              ),
              const SizedBox(width: 10),
              const Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align text to the left
                children: [
                  Text('Add routine...',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                ],
              )
            ],
          ),
        ),
        onTap: () => context.push(routes.composePath));
  }
}
