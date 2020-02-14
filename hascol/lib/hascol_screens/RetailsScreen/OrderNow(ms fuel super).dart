import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/RetailsScreen/Retails.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';

class OrderNowMsFuel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderNowMsFuelState();
  }
}

class OrderNowMsFuelState extends State<OrderNowMsFuel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[cFunc.logoImageAdd(150.0, 150.0)],
        title: Text("Order Now"),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              imageAdd(150.0, 150.0, "images/SuperTiger-XT-logo.jpg"),
              Text(
                "MS (Fuel Super)",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
              ),
//              cFunc.textFields("a", (v) {}, "Quantity", "Quantity"),
              Container(
                padding: EdgeInsets.all(20.0),
              ),
              cFunc.buttons("Order Now", () {})
            ]),
          ),
        ],
      ),
    );
  }
}
