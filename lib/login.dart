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
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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
                        color: Colors.pink[200],
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
                    style: TextStyle(color: Colors.pink[200]),
                  ),
                  TextField(
                    
                    controller: usernameC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 244, 143, 177)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: ("masukkan username"),
                      fillColor: Color.fromARGB(22, 0, 0, 0),
                      filled: true,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              margin: EdgeInsets.only(
                bottom: 50,
              ),
              child: Column(
                children: <Widget>[
                  Text("password", style: TextStyle(color: Colors.pink[200])),
                  password = TextField(
                    obscureText: true,
                    controller: passwordC,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 244, 143, 177)),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: ("masukkan password"),
                      fillColor: Color.fromARGB(22, 0, 0, 0),
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
              style: ElevatedButton.styleFrom(
                minimumSize: Size(200, 50),
                // padding: EdgeInsets.all(10),
                primary: Colors.pink[200],
                shape: StadiumBorder(),
              ),
              child: Text(
                "submit",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
