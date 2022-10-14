import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'main.dart';
import 'setting.dart';
import 'login.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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

    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      //kotak profil
      UserAccountsDrawerHeader(
        accountName: Text("Hannela Deyzy Annabelle"),
        accountEmail: Text("deyzy@gmail.com"),
        currentAccountPicture: CircleAvatar(
          child: ClipOval(
            child: Image.asset(
              "images/dz.jpeg",
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: Colors.pink[200],
        ),
      ),

      // menu list
      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => home()));
        },
        leading: Icon(
          Icons.home,
          color: Colors.grey,
        ),
        title: Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      ListTile(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MySetting()));
        },
        leading: Icon(
          Icons.settings,
          color: Colors.grey,
        ),
        title: Text(
          "Setting",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
      ListTile(
        leading: IconButton(
            onPressed: () {
              logout();
            },
            icon: Icon(Icons.logout, color: Colors.grey),
            ),
      ),
    ]));
  }
}
