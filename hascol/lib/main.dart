import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hascol/hascol_screens/login.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hascol',
      home: Scaffold(body: Login()
      ),
    );
  }
}
