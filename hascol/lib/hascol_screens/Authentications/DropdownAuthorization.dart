//import "package:flutter/material.dart";
//import 'dart:async';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:hascol/hascol_screens/All_Instances.dart';
//
//class RolesDropdownn extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return RolesDropdownState();
//  }
//}
//
//class RolesDropdownState extends State<RolesDropdownn> {
//  @override
//  Widget build(BuildContext context) {
//    List data = [];
//    List<DropdownMenuItem> itemsOfDD = [];
//
//    Future<String> fetchRoles() async {
//      if (itemsOfDD.length == 0) {
//        var res = await http.get(Uri.decodeFull(appUrls.getRolesUrl));
//        var resBody = json.decode(res.body);
//        data = resBody["data"];
//        itemsOfDD = [];
//        print(data);
//        data.forEach((d) {
//          print(d);
//          setState(() {
//            itemsOfDD.add(DropdownMenuItem(
//              child: new Text(d['role']),
//              value: d['role_id'].toString(),
//            ));
//          });
//        });
//      }
//    }
//
//    return Container();
//  }
//}
//
//class GetRoles {
//  final int Role_id;
//  final String RoleName;
//
//  GetRoles({this.Role_id, this.RoleName});
//
//  factory GetRoles.fromjson(Map<String, dynamic> json) {
//    return GetRoles(
//      Role_id: json['role_id'],
//      RoleName: json["role"],
//    );
//  }
//}
