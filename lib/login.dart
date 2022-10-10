import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';

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
      backgroundColor: Color.fromARGB(255, 37, 37, 37),
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text("login page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 50,
                top: 10,
              ),
              child: Column(
                children: [
                  Text("Login",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 60,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(
                bottom: 10,
              ),
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  Text(
                    "username",
                    style: TextStyle(color: Colors.white),
                  ),
                  TextField(
                    controller: usernameC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 244, 143, 177)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: ("masukkan username"),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(
                bottom: 50,
              ),
              child: Column(
                children: [
                  Text("password", style: TextStyle(color: Colors.white)),
                  password = TextField(
                    obscureText: true,
                    controller: passwordC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 244, 143, 177)),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: ("masukkan password"),
                      fillColor: Colors.white,
                      filled: true,
                    ),
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
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("salah input")));
                  }
                },
                child: Text("submit"))
          ],
        ),
      ),
    );
  }
}
