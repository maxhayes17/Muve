import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;

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
    if (_formKey.currentState!.validate()) {
      String username = _usernameController.text;
      String password = _passwordController.text;
      context.go(routes.homePath);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Getting Swoll $username")));
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
            //email
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.mail), hintText: "email"),
              controller: _usernameController,
              // validator: ValidationBuilder().email().build(),
            ),
            //password
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.password), hintText: "password"),
              obscureText: true,
              controller: _passwordController,
              // validator: ValidationBuilder().required().build(),
            ),
            //login button
            ElevatedButton(onPressed: _login, child: const Text("Login"))
          ],
        ));
  }
}
