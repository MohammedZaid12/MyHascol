import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';
import 'package:hascol/hascol_screens/HodScreens/Hod.dart';
import 'package:hascol/hascol_screens/RetailsScreen/Retails.dart';
import 'package:hascol/hascol_screens/RsmScreens/Rsm.dart';

class RedirectToScreens extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RedirectState();
  }
}

class RedirectState extends State<RedirectToScreens> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cFunc.myAppBar(context),
//        drawer: cFunc.MyDrawer(),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(150.0),
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
            ),
            cFunc.buttons("HOD Screen", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HOD()));
            }),
            cFunc.buttons("RSM Screen", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => RSM()));
            }),
            cFunc.buttons("RET Screen", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Retails()));
            })
          ],
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/backgroundHascol.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
