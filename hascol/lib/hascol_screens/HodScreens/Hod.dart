import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/HodScreens/Asm.dart';
import 'package:hascol/hascol_screens/HodScreens/Rsm.dart';
import 'package:hascol/hascol_screens/HodScreens/myUsers.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';
import 'package:hascol/hascol_screens/HodScreens/Statistics.dart';

class HOD extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HodScreens();
  }
}

class HodScreens extends State<HOD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cFunc.myAppBar(context),
      drawer: cFunc.myDrawer(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroundHascol.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
            margin: EdgeInsets.only(top: 250.0, right: 50.0, left: 50.0),
            child: ListView(
              children: <Widget>[
                cFunc.buttons("MyUsers", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyUsers()));
                }),
                cFunc.buttons("Regional Sales Manager", () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Rsm()));
                }),
                cFunc.buttons("Area Sales Manager", () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => ASM()));
                }),
                cFunc.buttons("Stastics", () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Statistics()));
                }),
              ],
            )),
      ),
    );
  }
}
