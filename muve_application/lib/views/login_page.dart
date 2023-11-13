import 'package:flutter/material.dart';
import 'package:muve_application/widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
      const SizedBox(
        height: 150,
      ),
      Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Let's get",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                // Text("Muvin'",
                //   style: TextStyle(
                //     fontSize: 80,
                //     fontWeight: FontWeight.w800,
                //   ),
                // ),
                // Container(child:Image.asset('assets/Muvin.png') ,),
                Image.asset('assets/Muvin.png'),
            ],
            )
          ),
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
              color: Colors.blueGrey[900],
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  LoginForm(),
                ],
              )
            )
            )
        ),
      )
    ]
    )
    );
  }
}
