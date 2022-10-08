import 'package:flutter/material.dart';

class Myheader extends StatefulWidget {
  const Myheader({super.key});

  @override
  State<Myheader> createState() => _MyheaderState();
}

class _MyheaderState extends State<Myheader> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.pink[200],
        width: double.infinity,
        height: 200,
        // padding:EdgeInsets.only(top: 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: EdgeInsets.only(bottom: 10),
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage('images/dz.jpeg')))),
            Text("Hannela Deyzy A",
                style: TextStyle(color: Colors.white, fontSize: 20)),
            Text("kullkas lemod",
                style: TextStyle(color: Colors.white24, fontSize: 14))
          ],
        ));
  }

  //widget membuat list di drawer
  Widget Mydrawerlist() {
    return Container(
        padding: EdgeInsets.only(top: 15, bottom: 15),
        child: Column(
          children: [
            menuItem(),
          ],
        ));
  }

  //widget item drawer
  Widget menuItem() {
    return Material(
        child: InkWell(
      onTap: () {},
      child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20),
          child: Row(children: [
            Expanded(
              child: Icon(
                Icons.dashboard_outlined,
                size: 20,
                color: Colors.black,
              ),
            ),
            Expanded(
                flex: 4,
                child: Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                )),
          ])),
    ));
  }
}
