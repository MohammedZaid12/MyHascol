import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/RsmScreens/MyOrders.dart';
import 'package:hascol/hascol_screens/RsmScreens/MyUsers.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';

class RSM extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RsmScreens();
  }
}

class RsmScreens extends State<RSM> {
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
                    cFunc.buttons("My Users", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyUsers()));
                    }),
                    cFunc.buttons("My Orders", () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyOrders()));
                    }),
                  ],
                ))));
  }
}
