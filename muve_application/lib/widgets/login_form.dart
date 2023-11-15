import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    final UserViewModel userVM = context.read<UserViewModel>();

    if (_formKey.currentState!.validate()) {
      String email = _usernameController.text.toLowerCase();
      String password = _passwordController.text;
      if (userVM.authenticateUser(email, password)) {
        context.go(routes.homePath);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Getting Swoll ${userVM.username}")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("INVALID INPUTS:")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("INVALID INPUTS:")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 56,
                padding: const EdgeInsets.only(
                    left: 10, top: 12, bottom: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Center(
                    child: Row(
                  children: [
                    const Icon(Icons.email, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        controller: _usernameController,
                        validator: ValidationBuilder().email().build(),
                      ),
                    )
                  ],
                ))),
            const SizedBox(
              height: 10,
            ),
            Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: 56,
                padding: const EdgeInsets.only(
                    left: 10, top: 12, bottom: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Center(
                    child: Row(
                  children: [
                    const Icon(Icons.lock, color: Colors.grey),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        obscureText: true,
                        controller: _passwordController,
                        validator: ValidationBuilder().required().build(),
                      ),
                    )
                  ],
                ))),
            const SizedBox(
              height: 40,
            ),
            //login button
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 60,
                decoration: BoxDecoration(color: Colors.amber[900], borderRadius: BorderRadius.all(Radius.circular(10)),),
                child: Center(child: Text(
                    "Login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),),
              ),
              onTap: _login,
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "New user?",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white,),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 60,
                decoration: BoxDecoration(color: Colors.blueGrey[700], borderRadius: BorderRadius.all(Radius.circular(10)),),
                child: Center(child: Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)),),
              ),
              onTap: _login,
            )
          ],
        ));
  }
}
