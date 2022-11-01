import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quizzer/helper/authenticate.dart';
import 'package:quizzer/helper/constants.dart';
import 'package:quizzer/views/home.dart';
import 'package:quizzer/widget/widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isUserLoggedIn = false;
  @override
  void initState() {
    super.initState();
    getLoggedInState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    isUserLoggedIn ? Home() : const Authenticate())));
  }

  getLoggedInState() async {
    await Constants.getUerLoggedInSharedPreference().then((value) {
      setState(() {
        //###
        isUserLoggedIn = value as bool;
        print("checking: $isUserLoggedIn");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: AppLogo()));
  }
}
