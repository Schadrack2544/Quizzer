import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizzer/helper/authenticate.dart';
import 'package:quizzer/helper/constants.dart';
import 'package:quizzer/views/home.dart';
import 'package:quizzer/widgets/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...



void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isUserLoggedIn = false;

  @override
  void initState() {
    getLoggedInState();
    super.initState();
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

    return MaterialApp(
      title: 'Quizzer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor:Colors.redAccent,
      ),
      home: isUserLoggedIn ? Home() : const SplashScreen(),
    );
  }
}
