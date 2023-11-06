import 'package:flutter/material.dart';
import 'package:muve_application/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      const SizedBox(
        height: 150,
      ),
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: FittedBox(
            child: Text(
              "Motivational Message",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w800,
              ),
            ),
          )),
      Expanded(
          // Align card to bottom-center
          child: Align(
        alignment: FractionalOffset.bottomCenter,
        // Create rounded corners
        child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            // Card itself
            child: Container(
              height: MediaQuery.of(context).size.height * (0.6),
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey,
              child: const Padding(
                  padding: EdgeInsets.all(50), child: LoginForm()),
            )),
      ))
    ]));
  }
}
