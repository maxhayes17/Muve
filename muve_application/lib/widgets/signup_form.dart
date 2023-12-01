import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;
import 'package:muve_application/viewmodels/user_view_model.dart';
import 'package:provider/provider.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _signup() {
    final UserViewModel userVM = context.read<UserViewModel>();

    if (_formKey.currentState!.validate()) {
      String email = _emailController.text.toLowerCase();
      String password = _passwordController.text;
      String username = _usernameController.text;
      if (userVM.addUser(email, username, password)) {
        context.go(routes.loginPath);
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
                        controller: _emailController,
                        validator: ValidationBuilder().email().build(),
                      ),
                    )
                  ],
                )
              )
            ),
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
                    const Icon(Icons.person, color:Colors.white70),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "Username",
                          hintStyle: TextStyle(color:Colors.white70),
                        ),
                        controller: _usernameController,
                        validator: ValidationBuilder().minLength(1).maxLength(20).build(),
                      ),
                    )
                  ],
                )
              )
            ),
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
                    const Icon(Icons.lock, color:Colors.white70),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration.collapsed(
                          hintText: "Password",
                          hintStyle: TextStyle(color:Colors.white70),
                        ),
                        obscureText: true,
                        controller: _passwordController,
                        validator: ValidationBuilder().required().build(),
                      ),
                    )
                  ],
                )
              )
            ),
            const SizedBox(
              height: 40,
            ),
            //Signup button
            GestureDetector(
              onTap: _signup,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: 60,
                decoration: BoxDecoration(color: Colors.orange[700], borderRadius: const BorderRadius.all(Radius.circular(10)),),
                child: const Center(child: Text(
                    "Sign up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),),
              ),
            ),
          ],
        ));
  }
}
