import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/Authentications/SignupAuthorization.dart';
import 'package:hascol/hascol_screens/login.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'CommonThings/All_Instances.dart';



class Signup extends StatelessWidget {
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
  String currenRegion;
  String currenRole;


  String email;
  String name;
  int jdeCode;
  String password;
  int cnicNumber;
  int phoneNumber;
  String regions;
  String rolesController;


  fieldEmptyOrNot() {

    String email, password , phoneNumber , name;

    email = emailController.text;
    password = passwordController.text;
    phoneNumber = phoneNumberController.text;
    name = nameController.text;

    if (email == '' || password == '' || phoneNumber == '' || name=='') {
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
    }
  }


  List data = [];
  List<DropdownMenuItem> itemsOfDD = [];

  List regionsData = [];
  List<DropdownMenuItem> itemsOfDD1 = [];

  Future<String> fetchRoles() async {
    if (itemsOfDD.length == 0) {
      var res = await http.get(Uri.decodeFull(appUrls.getRolesUrl));
      var resBody = json.decode(res.body);
      data = resBody["data"];
      print(resBody["success"]);
      itemsOfDD = [];
      print(data);
      data.forEach((d) {
        print(d);
        setState(() {
          itemsOfDD.add(DropdownMenuItem(
            child: new Text(d['role']),
            value: d['role_id'].toString(),
          ));
        });
      });
    }

  }

  Future<String> fetchRegions() async {
    if (itemsOfDD1.length == 0) {
      var regionsRes = await http.get(Uri.decodeFull(appUrls.getRegionsUrl));
      var RresBody = json.decode(regionsRes.body);
      regionsData = RresBody["data"];
      itemsOfDD1 = [];
      print(regionsData);
      regionsData.forEach((d1) {
        print(d1);
        setState(() {
          itemsOfDD1.add(DropdownMenuItem(
            child: new Text(d1['region_name']),
            value: d1['id'].toString(),
          ));
        });
      });
    }
  }


  Future doSignUp(map, success) async {
    final response = await http.post(appUrls.registerUrl, body: map);
    if (response.statusCode < 200 ||
        response.statusCode > 400 ||
        json == null) {
      throw new Exception("Error while posting data");
    } else {
      var _response = json.decode(response.body);
      if (_response["error"] == false) {
        var obj = SignUpAuth.fromjson(_response["data"]);
        success(obj);
        print(obj);
        return obj;
      } else {
        return fieldEmptyOrNot();
      }
    }
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
              this.email=v;
            }, "Email Address", "Email Address", obscuretext: false , controller:emailController )),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.password=v;
            }, "Password", "", obscuretext: true ,  controller:passwordController)),

        Padding(
          padding: EdgeInsets.all(10.0),
          child: cFunc.textFields("a", (v) {
            this.name=v;
          }, "Name", "Enter Your Name", obscuretext: false ,  controller:nameController),
        ),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.jdeCode=v;
            }, "JDE Code", "", obscuretext: false)),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.phoneNumber=v;
            }, "PhoneNumber", "",
                tType: TextInputType.number, obscuretext: false ,  controller:phoneNumberController)),
        Padding(
            padding: EdgeInsets.all(10.0),
            child: cFunc.textFields("a", (v) {
              this.cnicNumber=v;
            }, "CNIC Number", "",
                tType: TextInputType.number, obscuretext: false)),
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
            } else {
              return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: DropdownButton(
                    items: itemsOfDD1.toList(),
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

//        ),
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
            } else {
              return Padding(
                  padding: EdgeInsets.all(20.0),
                  child: DropdownButton(
                    items: itemsOfDD.toList(),
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
          child: cFunc.buttons("Create Account", () async{



print("aa");
            email=emailController.text;
            password=emailController.text;
            jdeCode=jdeController.hashCode;
            phoneNumber= phoneNumberController.hashCode;
            cnicNumber=cnicController.hashCode;
            name = nameController.text;



            if (email != "" && password != "" && phoneNumber!="" && name != "") {
              var map = new Map<String, dynamic>();
              map["name"] = name.toString();
              map["password"] = password.toString();
              map["email"] = email.toString();
              map["jde_code"] = jdeCode.toString();
              map["location"] = fetchRegions().toString();
              map["phone_number"] = phoneNumber.toString();
              map["role_id"] = fetchRoles().toString();
              map["nic"] = cnicNumber.toString();

              CircularProgressIndicator();
              this.doSignUp(map, (SignUpAuth signup) {
                print("succes");
                if (signup.roleName == "ASM") {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => hascolLogin));
                }
              });
            }

            fieldEmptyOrNot();}),
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
          child: cFunc.buttons("Back To login", () {
            CircularProgressIndicator();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Login()));
          }),
        )
      ],
    );
  }
}
