import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/compose_view_model.dart';
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
    context.read<ComposeViewModel>().updateRoutineCount();

    if (_formKey.currentState!.validate()) {
      String email = _usernameController.text.toLowerCase();
      String password = _passwordController.text;
      if (userVM.authenticateUser(email, password)) {
        context.go(routes.homePath);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Welcome back ${userVM.username}!")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("INVALID INPUTS")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("INVALID INPUTS")));
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
                  color: Colors.white12,
                ),
                child: Center(
                    child: Row(
                  children: [
                    const Icon(Icons.email, color: Colors.white70),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.white70),
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
                  color: Colors.white12,
                ),
                child: Center(
                    child: Row(
                  children: [
                    const Icon(Icons.lock, color: Colors.white70),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.white70),
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
              onTap: _login,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.orange[700],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text("Login",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white)),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              "New user?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => context.push(routes.signupPath),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 60,
                decoration: const BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Center(
                  child: Text("Sign up",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.orangeAccent)),
                ),
              ),
            )
          ],
        ));
  }
}
