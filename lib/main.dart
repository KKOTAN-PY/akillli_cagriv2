import 'package:akilli_cagri/screens/login_screen.dart';
import 'package:flutter/material.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyApp();
  }

  }

class _MyApp extends State{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: LoginScreen(),
    );
  }

}
  // This widget is the root of your application.
