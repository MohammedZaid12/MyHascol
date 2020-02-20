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
  bool isLogin = false ;

  bool visible = true;
  final usernameController = new TextEditingController();
  final passwordController = new TextEditingController();
  String username;
  String password;




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
        print(_response["error"]);
        print(_response["message"]);


        return cFunc.dialogBox("Error " , _response["message"] , context);


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
            child: cFunc.buttons("Login", () async{

              SharedPreferences loginPrefrence = await SharedPreferences.getInstance();
              var hascolUsernames=loginPrefrence.setString(username, username).toString();
              var hascolPasswords = loginPrefrence.setString(password, password).toString();
              hascolUsernames=username;hascolPasswords=password;
                if (hascolUsernames != "" && hascolPasswords != "") {
                   print("amdnld");

                   hascolUsernames=username;
                   hascolPasswords=password;
                  loginPrefrence.setBool("isLogin", true);
                  var map = new Map<String, dynamic>();
                  map["username"] = hascolUsernames.toString();
                  map["password"] = hascolPasswords.toString();

                    this.doLoginN(map, (LoginAuthorization log) {
                      print(log.roleName);
                      if (log.roleName == "RSM") {
                        Navigator.pushAndRemoveUntil(
                            context, routeToRsm, (Route<dynamic> r) => false);
                      } else if (log.roleName == "HOD") {
                        Navigator.pushAndRemoveUntil(
                            context, routeToHod, (Route<dynamic> r) => false);
                      } else if (log.roleName == "Retailer") {
                        Navigator.pushAndRemoveUntil(
                            context, routeToRetails, (
                            Route<dynamic> r) => false);
                      } else if (log.roleName == "ASM") {
                        Navigator.pushAndRemoveUntil(
                            context, routeToAsm, (Route<dynamic> r) => false);
                      }
                    });
                  }
                }




            ),
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
}



