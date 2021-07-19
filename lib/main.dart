import 'package:flutter/material.dart';

import 'screen/LoginPage.dart';

//http://13.112.99.27/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}
