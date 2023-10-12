import 'dart:math';

import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
            children: [
              SizedBox(height: 150,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("Motivational Message'", 
                  style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              Expanded(child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: 
                ClipRRect( 
                  child: Container(
                    height: MediaQuery.of(context).size.height * (0.55),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.blueGrey,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  ),
                )
                )
              )
            ],
          )
        );
  }




}