import 'package:flutter/material.dart';
import 'drawerku.dart';
import 'main.dart';

class MySetting extends StatelessWidget {
  const MySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
        appBar: AppBar(
      title: Text("Setting"),
      backgroundColor: Colors.pink[200],
       ),
    body: Center(
      child: Column(
        children:[
          Text("disini isinya setting"),

          
        ]
      )
    ),
    );
  }
}
