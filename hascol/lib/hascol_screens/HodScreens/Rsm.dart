import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';

class Rsm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RsmState();
  }
}

class RsmState extends State<Rsm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        actions: <Widget>[cFunc.logoImageAdd(150.0, 150.0)],
        title: Text("RSM Orders"),
      ),
      body: Table(
        border: TableBorder.all(color: Colors.grey),
        children: [
          TableRow(children: [
            TableCell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "RSM Name",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Text(
                    "HSD",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Text("MS", style: TextStyle(fontSize: 25.0)),
                  Text("Lube", style: TextStyle(fontSize: 25.0))
                ],
              ),
            )
          ]),
          TableRow(children: [
            TableCell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "RSM Name",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Text(
                    "HSD",
                    style: TextStyle(fontSize: 25.0),
                  ),
                  Text("MS", style: TextStyle(fontSize: 25.0)),
                  Text("Lube", style: TextStyle(fontSize: 25.0))
                ],
              ),
            )
          ])
        ],
      ),
    );
  }
}
