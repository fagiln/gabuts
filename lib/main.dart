import 'package:flutter/material.dart';
import 'home.dart';
import 'package:shared_preferences/shared_preferences.dart';	

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: login_page(),
    );
  }
}

// mrmbuat fungsi login dan di panggil di MaterialApp home
class login_page extends StatelessWidget {
  final usernameC = TextEditingController();
  final passwordC = TextEditingController();

  //fungsi untuk autentikasi login
  bool login(String username, String password) {
    if (username == "fagildeyzy" && password == "191102") {
      return true;
    } else {
      return false;
    }
  }

  //fungsi untuk memnambahkan username yang telah login
  addStrinToSF(String value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', value);
  }

  @override
  Widget build(BuildContext context) {
    var username;
    var password;
 
  //fungsi untuk mengecek apakah sudah melakukan login atau belum
    cekLogin() async {
      SharedPreferences pref = await SharedPreferences.getInstance();

      String valueSF = pref.getString("username").toString();

      if (valueSF == "fagildeyzy") {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => home(),
        ));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("sesion tidak ada")));
      }
    }

    cekLogin();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text("login page"),
      
      ),
      
      
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 50,top: 10,),
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 50),
                  ),
                ],
              ),
            ),
            
            
            Container(
              width: 300,
              margin: EdgeInsets.only(bottom: 10,),
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Text("username"),
                  TextField(
                    controller: usernameC,
                    decoration:
                        InputDecoration(label: Text("masukan username")),
                  )
                ],
              ),
            ),
            
            
            Container(
              width: 300,
              margin: EdgeInsets.only(bottom: 50,),
              child: Column(
                children: [
                  Text("password"),
                  password = TextField(
                    obscureText: true,
                    controller: passwordC,
                    decoration: InputDecoration(
                        label: Text(
                      "masukan password",
                    )),
                  )
                ],
              ),
            ),
            
            
            ElevatedButton(
                onPressed: () async {
                  bool isLogin = login(usernameC.text, passwordC.text);
                  var pref = await SharedPreferences.getInstance();
               
                  cekLogin();
                 
                  if (isLogin) {  
                    addStrinToSF(usernameC.text);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => home(),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("salah input")));
                  }
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }
}
