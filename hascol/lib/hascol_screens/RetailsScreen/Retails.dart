import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hascol/hascol_screens/RetailsScreen/OrderNow(ms%20fuel%20super).dart';
import 'package:hascol/hascol_screens/CommonThings/All_Instances.dart';
import 'package:hascol/hascol_screens/RetailsScreen/OrderNow(hsd%20fuel%20turbo).dart';

class Retails extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return RetailsState();
  }
}

class RetailsState extends State<Retails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: cFunc.myAppBar(context),
      drawer: cFunc.myDrawer(context),
      body: ListView(children: <Widget>[
        imageAdd(140.0, 200.0, "images/fuel-Station-1-1.jpg"),
        Container(
          padding: EdgeInsets.only(bottom: 20.0),
        ),
        new ProductList("FUEL", [
          new ProductCls("MS (Fuel Super)", "images/SuperTiger-XT-logo.jpg",
              OrderNowMsFuel()),
          new ProductCls("HSD(Fuel Turbo)", "images/SuperTiger-XT-logo.jpg",
              OrderNowHsdFuel()),
        ]),
        Container(
          padding: EdgeInsets.only(bottom: 20.0, top: 20.0),
        ),
        new ProductList("Lubricant", [
          new ProductCls("Diesel Engine", "images/SuperTiger-XT-logo.jpg",
              OrderNowMsFuel()),
          new ProductCls("Passenger Car", "images/SuperTiger-XT-logo.jpg",
              OrderNowMsFuel()),
          new ProductCls("Motor Cycle ", "images/SuperTiger-XT-logo.jpg",
              OrderNowMsFuel()),
          new ProductCls(
              "Gear Oil", "images/SuperTiger-XT-logo.jpg", OrderNowMsFuel()),
          new ProductCls(
              "others", "images/SuperTiger-XT-logo.jpg", OrderNowMsFuel()),
        ]),
        Container(
          padding: EdgeInsets.only(bottom: 20.0),
        ),
      ]),
    );
  }
}

class ProductCls {
  final String productTitle;
  final String imagePath;
  Widget navigateTo;

  ProductCls(this.productTitle, this.imagePath, this.navigateTo);
}

class ProductList extends StatelessWidget {
  final String categoryName;

  final List<ProductCls> products;

  ProductList(this.categoryName, this.products);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          this.categoryName,
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
        ),
        Container(
          padding: EdgeInsets.only(bottom: 20.0),
        ),
        //(orientation == Orientation.portrait) ?
        GridView.builder(
          gridDelegate:
              new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: this.products.length,
          physics: ScrollPhysics(),
          shrinkWrap: true,
//          crossAxisCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return BodyWidget(Colors.white, this.products[index]);
          },
//          crossAxisSpacing: 6.0,
        ),
      ],
    );
  }
}

Widget imageAdd(height, margin, path) {
  AssetImage assetImage = new AssetImage(path);
  Image image = new Image(
    image: assetImage,
    width: margin,
    height: height,
  );
  return Container(
    child: image,
  );
}

class BodyWidget extends StatelessWidget {
  final Color color;
  final ProductCls products;

  BodyWidget(this.color, this.products);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => this.products.navigateTo));
        },
        child: Container(
          height: 75.0,
          color: color,
          child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black12)),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      this.products.productTitle,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                  imageAdd(100.0, 100.0, this.products.imagePath),
                  Divider(),
                  Container(
                    padding: EdgeInsets.all(25.0),
                  ),
                ],
              )),
          alignment: Alignment.center,
        ));
  }
}
