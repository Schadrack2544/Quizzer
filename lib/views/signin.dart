import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzer/services/auth.dart';
import 'package:quizzer/views/home.dart';
import 'package:quizzer/widget/widget.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;

  const SignIn({super.key, required this.toogleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  AuthService authService = AuthService();
  justSignIn(String email, String password) {
    authService.signInEmailAndPass(email, password).then((value) {
      if (value != null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Home()));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) => CupertinoAlertDialog(
                  title: Text("Failed to log in"),
                  content: Text("Oops! Something wrong happens"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop('Cancel');
                      },
                      child: Text("OK"),
                    )
                  ],
                ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.white));
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const AppLogo(),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        //brightness: Brightness.li,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            const Spacer(),
            Container(
              child: Column(
                children: [
                  const TextField(
                    autofocus: true,
                    decoration: InputDecoration(hintText: "Email"),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const TextField(
                    decoration: InputDecoration(hintText: "Password"),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  GestureDetector(
                    onTap: () {
                      String email = emailEditingController.text;
                      String password = passwordEditingController.text;
                      justSignIn(email, password);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          borderRadius: BorderRadius.circular(30)),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account? ',
                          style:
                              TextStyle(color: Colors.black87, fontSize: 17)),
                      GestureDetector(
                        onTap: () {
                          widget.toogleView();
                        },
                        child: Container(
                          child: const Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.black54,
                                  decoration: TextDecoration.underline,
                                  fontSize: 17)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            )
          ],
        ),
      ),
    );
  }
}
