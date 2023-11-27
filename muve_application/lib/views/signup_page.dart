import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget{
  const SignupPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sign up'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 32, right: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  color: Colors.black87
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text("Start using Muve",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ],
          )
        )
      )
    );
  }
}