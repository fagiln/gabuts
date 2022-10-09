import 'package:flutter/material.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawerku.dart';
import 'login.dart';

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
        appBar: AppBar(title: Text("Home"), backgroundColor: Colors.pink[200]),
        body: Center(
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 15,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "Selamat datang di Blackpink Shop",
                        style: TextStyle(fontSize: 20, color: Colors.pink[200],
                      ),
                      ),
                    ]
                  ),
                ),
              ]),
        ));
  }

  //widget membuat list di drawer
  
}
