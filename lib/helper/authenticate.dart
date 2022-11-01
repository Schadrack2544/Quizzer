import 'package:flutter/material.dart';
import 'package:quizzer/views/signin.dart';
import 'package:quizzer/views/signup.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;

  void toggleView() {
    setState(() {
      showSignIn = !showSignIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return SignIn(toogleView: toggleView);
    } else {
      return SignUp(toogleView: toggleView);
    }
  }
}
