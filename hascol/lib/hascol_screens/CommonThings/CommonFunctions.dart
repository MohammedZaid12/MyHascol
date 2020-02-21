import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';
import 'package:hascol/hascol_screens/RsmScreens/MyOrders.dart';
import 'package:hascol/hascol_screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Cfunctions {
  Widget textFields(String validation ,  onChange, label, hint,
      {tType: TextInputType.text, obscuretext: true , controller , submit}) {
    return TextFormField(
      obscureText: obscuretext,

      validator: (value) => value.isEmpty ? validation : "Required",
      onChanged: onChange,
      onFieldSubmitted: submit,
      controller : controller,
      keyboardType: tType,
      decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          )),
    );
  }

  Widget buttons(text, press) {
    return RaisedButton(
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.w400, color: Colors.white),
      ),
      color: Colors.grey,
      elevation: 60.0,
    );
  }

  Widget dropDownButton(regions, String currentdropdownItem) {
    var region = regions;
    var current = currentdropdownItem;

    return DropdownButton<String>(
      items: region.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (newValue) {
        current = newValue;
      },
      value: current,
    );
  }

  Widget logoImageAdd(height, margin) {
    AssetImage assetImage = new AssetImage("images/hascol_logo.png");
    Image image = new Image(
      image: assetImage,
      width: margin,
      height: height,
    );
    return Container(
      child: image,
    );
  }

  Widget myDrawer(BuildContext context) {
    return Drawer(
      elevation: 6.0,
      child: ListView(
        children: <Widget>[
          _createHeader(),
          ListTile(
              title: Row(
            children: <Widget>[Icon(Icons.home), Text('Home')],
          )),
          Divider(
            color: Colors.black,
          ),
          ListTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new MyOrders()));
              },
              title: Row(
                children: <Widget>[Icon(Icons.shopping_cart), Text('Orders')],
              )),
          Divider(
            color: Colors.black,
          ),
          ListTile(
              onTap: () async{
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove(cKeys.auth);
                prefs.remove(cKeys.roleName);
                print("destroyed");
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (BuildContext ctx) => Login()));
              },
              title: Row(
                children: <Widget>[
                  Icon(Icons.account_circle),
                  Text('Logout'),

                ],
              )),
        ],
      ),
    );
  }

  PreferredSizeWidget myAppBar(BuildContext context) {
    Cfunctions func = new Cfunctions();
    return AppBar(
      actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 110.0, top: 11.0),
          child: Text(
            "HASCOL",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w400),
          ),
        ),
        GestureDetector(
          child: Icon(Icons.shopping_cart),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyOrders()));
          },
        )
      ],
      backgroundColor: Colors.deepOrange,
      title: SizedBox(
        child: func.logoImageAdd(160.0, 160.0),
      ),
    );
  }

   dialogBox ( titleText , contextText , BuildContext context){
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return ListView(
            children: <Widget>[
              Visibility(

                  child: Container(
                    margin: EdgeInsets.only(bottom: 30),
//                        child: CircularProgressIndicator()
                  )),
              AlertDialog(
                title: Text(titleText),
                content: Text(contextText),
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

Widget _createHeader() {
  return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Divider(color: Colors.black),
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('images/backgroundHascol.jpg'))));
}
