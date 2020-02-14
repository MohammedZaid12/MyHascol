import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/HodScreens/Hod.dart';
import 'package:hascol/hascol_screens/Authentications/LoginAuth.dart';
import 'package:hascol/hascol_screens/RetailsScreen/Retails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hascol/hascol_screens/RsmScreens/Rsm.dart';
import 'package:hascol/hascol_screens/signup.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';

import 'Authentications/LoginAuth.dart';

class Login extends StatelessWidget {
  Login({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(),
    );
  }
}

class Form extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FormState();
  }
}

class _FormState extends State<Form> {
  bool visible = true;
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  String username;
  String password;

  fieldEmptyOrNot() {
    String username, password;

    username = usernameController.text;
    password = passwordController.text;

    if (username == '' || password == '') {
      showDialog(
          context: context,
          builder: (BuildContext context) {

            return ListView(
              children: <Widget>[
                Visibility(
                    visible: visible,
                    child: Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: CircularProgressIndicator()
                    )
                ),

                AlertDialog(
            title: Text("Field Is Empty"),
            content: Text("Username or password is empty"),

            actions: [

            FlatButton(
            child: Text("Close"),
            onPressed: () {
            Navigator.of(context).pop();
            },
            )
            ],
            )
              ],
            );

          });
    }
  }

  Future doLoginN(map, success) async {
    final response = await http.post(appUrls.loginUrl, body: map);
    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      throw new Exception("Error while fetching data");
    } else {
      setState(() {
        visible = false;
      });
      var _response = json.decode(response.body);
      if (_response["error"] == false) {
        var obj = LoginAuthorization.fromjson(_response["data"]);
        success(obj);
        print(obj);
        return obj;
      } else {
        return fieldEmptyOrNot();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: <Widget>[
          Center(
            child: cFunc.logoImageAdd(250.0, 250.0),
          ),
          Padding(
              padding: EdgeInsets.only(bottom: 20.0, right: 20.0, left: 20.0),
              child: cFunc.textFields(
                  "username is required",
                  (v) {
                    this.setState(() {
                      this.username = v;
                      if (username == null) {
                        Text("Username is required");
                      }
                    });
                  },
                  "EmailAddress/PhoneNumber",
                  "EmailAddress/PhoneNumber",
                  controller: usernameController,
                  submit: (v) {
                    print(v);
                  },
                  obscuretext: false)),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: cFunc.textFields(

                  "password is required", (v) {
                this.setState(() {
                  this.password = v;
                  if (password == "") {
                    Text("Username is required");
                  }
                });

              }, "Password", "Password",
                  obscuretext: true, controller: passwordController)),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: cFunc.buttons("Login", () {



              if (username != "" && password != "") {
                var map = new Map<String, dynamic>();
                map["username"] = username.toString();
                map["password"] = password.toString();

                CircularProgressIndicator();
                this.doLoginN(map, (LoginAuthorization log) {
                  print("succes");
                  if (log.roleName == "ASM") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => RSM()));
                  } else if (log.roleName == "HOD") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HOD()));
                  } else if (log.roleName == "Retailer") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Retails()));
                  }
                });
              }
            }),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: cFunc.buttons("SignUp", () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Signup()));
            }),
          ),
        ],
      ),
    );
  }
}

//final PageRouteBuilder _vHomeRoute = new PageRouteBuilder(
//  fullscreenDialog: true
////  pageBuilder: (BuildContext context , ) {
////
////},
//);