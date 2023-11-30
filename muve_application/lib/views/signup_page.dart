import 'package:flutter/material.dart';
import 'package:muve_application/widgets/signup_form.dart';

class SignupPage extends StatelessWidget{
  const SignupPage({super.key});
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('Sign up'),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 32,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  const Text("Start using",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    SizedBox(
                      width: 120,
                      child: Image.asset('assets/Muve_logo_sm.png'),
                    )
                ],
              )
            ),
            const SizedBox(height: 60,),
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
                    height: MediaQuery.of(context).size.height * (0.8),
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black87,
                    padding: const EdgeInsets.all(50),
                    child: const Column(
                      children: [
                        SizedBox(height: 20,),
                        SignupForm(),
                      ],
                    )
                  )
                )
              ),
            )
          ],
        )
      )
    );
  }
}