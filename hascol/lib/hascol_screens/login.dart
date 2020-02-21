import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/HodScreens/Asm.dart';
import 'package:hascol/hascol_screens/HodScreens/Hod.dart';
import 'package:hascol/hascol_screens/Authentications/LoginAuth.dart';
import 'package:hascol/hascol_screens/RetailsScreen/Retails.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hascol/hascol_screens/RsmScreens/Rsm.dart';
import 'package:hascol/hascol_screens/signup.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  int role_id;
  String name;

  String location;

  int nic;

  String role_name;

  String auth;

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
        print(_response["success"]);
        print(obj);
        return obj;
      } else {
        print("else m,e");
        print(_response["error"]);
        print(_response["message"]);

        return cFunc.dialogBox("Error ", _response["message"], context);
      }
    }
  }



  @override
  void initState() {
    super.initState();
    getPrefIdUser();
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
                  "UserName",
                  "UserName",
                  controller: usernameController,
                  submit: (v) {
                    print(v);
                  },
                  obscuretext: false)),
          Padding(
              padding: EdgeInsets.all(20.0),
              child: cFunc.textFields("password is required", (v) {
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
            child: cFunc.buttons("Login", () async {
              SharedPreferences loginPrefrence =
                  await SharedPreferences.getInstance();

              if (username != "" && password != "") {
                print("amdnld");


                var map = new Map<String, dynamic>();
                map["username"] = username.toString();
                map["password"] = password.toString();
                map["auth"] = auth.toString();
                map["role_id"] = role_id.toString();
                map["role_name"] = role_name.toString();
                map["nic"] = nic.toString();
                print(role_name);
//                print(map["role_name"]);

                loginPrefrence.setString(cKeys.username, map["username"]);
                loginPrefrence.setBool("isLogin", true);
                loginPrefrence.setString(cKeys.auth, map["auth"]);
                loginPrefrence.setString(cKeys.roleId, map["role_id"]);
                loginPrefrence.setString(cKeys.roleName, map["role_name"]);

                this.doLoginN( map ,(LoginAuthorization log) {

                  if (log.roleName == "RSM") {
                    Navigator.pushAndRemoveUntil(
                        context, routeToRsm, (Route<dynamic> r) => false);
                  } else if (log.roleName == "HOD") {
                    Navigator.pushAndRemoveUntil(
                        context, routeToHod, (Route<dynamic> r) => false);
                  } else if (log.roleName == "Retailer") {
                    Navigator.pushAndRemoveUntil(
                        context, routeToRetails, (Route<dynamic> r) => false);
                  } else if (log.roleName == "ASM") {
                    Navigator.pushAndRemoveUntil(
                        context, routeToAsm, (Route<dynamic> r) => false);
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
  String checkPref;
  String checkPrefRoleName;
  getPrefIdUser() async {


    LoginAuthorization log = new LoginAuthorization();
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      checkPref = sharedPreferences.getString(cKeys.auth);
      checkPrefRoleName = sharedPreferences.getString(cKeys.roleId);

      if (checkPref == null && checkPrefRoleName==null) {
        print("check null");
      return false;

      } else {
        print("fjoifjd");



        print(checkPref);
        if (checkPrefRoleName.isNotEmpty==1) {
          Navigator.pushAndRemoveUntil(
              context, routeToRsm, (Route<dynamic> r) => false);
        } else if (checkPrefRoleName == 2) {
          Navigator.pushAndRemoveUntil(
              context, routeToHod, (Route<dynamic> r) => false);
        } else if (checkPrefRoleName == 3) {
          Navigator.pushAndRemoveUntil(
              context, routeToRetails, (Route<dynamic> r) => false);
        } else if (checkPrefRoleName == 4) {
          Navigator.pushAndRemoveUntil(
              context, routeToAsm, (Route<dynamic> r) => false);
        }
      }

    });
  }


  final PageRouteBuilder routeToRsm = new PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return RSM();
    },
  );

  final PageRouteBuilder routeToAsm = new PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return ASM();
    },
  );

  final PageRouteBuilder routeToHod = new PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return HOD();
    },
  );

  final PageRouteBuilder routeToRetails = new PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Retails();
    },
  );
  final PageRouteBuilder routeToLogin = new PageRouteBuilder(
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Login();
    },
  );





}
