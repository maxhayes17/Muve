import 'package:flutter/material.dart';
import 'package:muve_application/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Column(children: <Widget>[
      SizedBox(
        height: 150,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: FittedBox(
            child: Text(
              "Motivational Message",
              style: TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.w800,
              ),
            ),
          )),
      LoginForm(),
      MaxArt()
    ]));
  }
}

class MaxArt extends StatelessWidget {
  const MaxArt({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Container(
                height: MediaQuery.of(context).size.height * (0.55),
                width: MediaQuery.of(context).size.width,
                color: Colors.blueGrey,
              ),
            )));
  }
}
