import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawerku.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    //membuat fungsi log out
    logout() async {
      var pref = await SharedPreferences.getInstance();
      pref.remove("username");
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => login_page(),
      ));
    }

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Myheader(),
            Mydrawerlist(),
            ListTile(

                leading: IconButton(
                    onPressed: () {
                      logout();
                    },
                    icon: Icon(Icons.logout, color: Colors.black)),
              ),
            
          ],
        ),
      ),
      appBar: AppBar(title: Text("home"), backgroundColor: Colors.pink[200]),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
           
            Container(
              margin: EdgeInsets.only(top: 30,),
              child: Column(
                children: [
                  Text(
                    "Selamat datang di Bp Shop",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),

          ]  
        ),
      )
    );
  }

  //widget membuat list di drawer
  Widget Mydrawerlist() {
    return Container(
      padding: EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        children: [
          menuItem(),
        ],

      )
    );
  }
  //widget item drawer
  Widget menuItem(){
    return Material(
      child: InkWell(
        onTap: (){},
        child: Padding(padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
                  Expanded(
                    child: Icon(Icons.dashboard_outlined, size: 20, color: Colors.black,),
                  ),
                  Expanded(
                    flex: 4,
                    child: 
                    Text("Home", 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    )
                  ),
               



          ]
        )
        ),

      )
    );
  }
}
