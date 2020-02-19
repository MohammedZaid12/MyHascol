import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/Authentications/SignupAuthorization.dart';
import 'package:hascol/hascol_screens/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'CommonThings/All_Instances.dart';

class Signup extends StatelessWidget {
  final Future<SignUpAuth> authSignUp;

  Signup({Key key, this.authSignUp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignupForm(),
    );
  }
}

class SignupForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormState();
  }
}

class FormState extends State<SignupForm> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  final nameController = new TextEditingController();
  final phoneNumberController = new TextEditingController();
  final jdeController = new TextEditingController();
  final cnicController = new TextEditingController();

  String email;
  String name;
  var jdeCode;
  String password;
  var cnicNumber;
  var phoneNumber;
  String regions;
  String rolesController;

  bool fieldEmptyOrNot() {
    String email, password, phoneNumber, name , role;

    email = emailController.text;
    password = passwordController.text;
    phoneNumber = phoneNumberController.text;
    name = nameController.text;
    role = currenRole;

    if (email == '' || password == '' || phoneNumber == '' || name == '' || role == null) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            CircularProgressIndicator();
            return AlertDialog(
              title: Text("Field Is Empty"),
              content: Text("Please Enter Following fields"),
              actions: [
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
     return false;
    }

    return true;
  }

  List data = [];
  List<DropdownMenuItem> rolesDDItems = [];

  List regionsData = [];
  List<DropdownMenuItem> regionDDItems = [];
  String currenRegion;
  String currenRole;

  Future<String> fetchRoles() async {
    if (rolesDDItems.length == 0) {
      var res = await http.get(Uri.decodeFull(appUrls.getRolesUrl));
      var resBody = json.decode(res.body);
      data = resBody["data"];
      print(resBody["success"]);
      rolesDDItems = [];
      print(data);
      data.forEach((d) {
        print(d);
        setState(() {
          rolesDDItems.add(DropdownMenuItem(
            child: new Text(d['role']),
            value: d['role_id'].toString(),
          ));
        });
      });
    }
  }

  Future<String> fetchRegions() async {
    if (regionDDItems.length == 0) {
      var regionsRes = await http.get(Uri.decodeFull(appUrls.getRegionsUrl));
      var RresBody = json.decode(regionsRes.body);
      regionsData = RresBody["data"];
      regionDDItems = [];
      print(regionsData);
      regionsData.forEach((d1) {
        print(d1);
        setState(() {
          regionDDItems.add(DropdownMenuItem(
            child: new Text(d1['region_name']),
            value: d1['id'].toString(),
          ));
        });
      });
    }
  }

  Future doSignUp(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;
      var _response = json.decode(response.body);

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      else {
        CircularProgressIndicator();
        isSuccessfullySignedUp();
        return SignUpAuth.fromjson(_response);
      }


    });
  }

  @override
  void initState() {
    super.initState();
//    this.fetchRoles();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 60.0),
          child: cFunc.logoImageAdd(200.0, 200.0),
        ),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.email = v;
            }, "Email Address", "Email Address",
                obscuretext: false, controller: emailController)),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.password = v;
            }, "Password", "",
                obscuretext: true, controller: passwordController)),

        Padding(
          padding: EdgeInsets.all(10.0),
          child: cFunc.textFields("a", (v) {
            this.name = v;
          }, "Username  ", "Enter Your Name",
              obscuretext: false, controller: nameController),
        ),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.jdeCode = v;
            }, "JDE Code", "", obscuretext: false , controller: jdeController)),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.phoneNumber = v;
            }, "PhoneNumber", "",
                tType: TextInputType.number,
                obscuretext: false,
                controller: phoneNumberController)),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.cnicNumber = v;
            }, "CNIC Number", "",
                tType: TextInputType.number, obscuretext: false , controller: cnicController)),
        Padding(
          padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
          child: Text(
            "Regions",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        FutureBuilder<String>(
          future: fetchRegions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData != '') {
              return Container(child: Text("Loading...."));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: DropdownButton(
                    items: regionDDItems.toList(),
                    onChanged: (newVal) {
                      print(newVal);
                      setState(() {
                        currenRegion = newVal;
                      });
                    },
                    value: currenRegion,
                    hint: Text("REGIONS"),
                  ));
            }
          },
        ),


        Padding(
          padding: EdgeInsets.only(right: 20.0, left: 20.0, top: 20.0),
          child: Text(
            "Roles",
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        FutureBuilder<String>(
          future: fetchRoles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.none &&
                snapshot.hasData == '') {
              return Container();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else {
              return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: DropdownButton(
                    items: rolesDDItems.toList(),
                    onChanged: (newVal) {
                      print(newVal);
                      setState(() {
                        currenRole = newVal;
                      });
                    },
                    value: currenRole,
                    hint: Text("Roles"),
                  ));
            }
          },
        ),

        Padding(
          padding: EdgeInsets.all(10.0),
          child: cFunc.buttons("Create Account", () async {

            if( fieldEmptyOrNot() ){
              print(jdeController.text);
              print(cnicController.text);

              try {
                SignUpAuth newPost = new SignUpAuth(
                  userId: "123",
                  Id: 0,
                  email: emailController.text,
                  password: passwordController.text,
                  username: nameController.text,
                  jdeCode: jdeController.text,
                  phoneNumber: phoneNumberController.text,
                  cnic: cnicController.text,
                  regionsId: getString(currenRegion),
                  roleId: getString(currenRole),
                );

                SignUpAuth _hascolSignupAuthentication =
                await doSignUp(appUrls.registerUrl, body: newPost.toMap());
                isSuccessfullySignedUp();
              } catch (Exception) {
                print(Exception);
              }
            }


          }),
        ),
        Padding(
          padding:


          EdgeInsets.all(10.0),
          child: cFunc.buttons("Back To login", () {
            CircularProgressIndicator();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          }),
        )
      ],
    );
  }

  isSuccessfullySignedUp() {
    CircularProgressIndicator();
    return
      showDialog(
        context: context,
        builder: (BuildContext context) {
          CircularProgressIndicator();
          return AlertDialog(
            title: Text("Congrats"),
            content: Text("You have successfully Signed Up"),
            actions: [
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
              )
            ],
          );
        });
  }
}
