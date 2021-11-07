import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _email = TextEditingController();
  final _password = TextEditingController();
  // String email;
  // String password;
  // void Covert() {
  //   setState(() {});
  //   email = _email.text;
  //   password = _password.text;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[400],
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(
              width: 150,
              height: 150,
              child: Image.asset('./images/imageLogin.png'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            Text(
              "Signln",
              textAlign: TextAlign.center,
              textScaleFactor: 5,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
            Text(
              "Speak, friend, and enter",
              textAlign: TextAlign.center,
              textScaleFactor: 2,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: _email,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Email'),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(30),
              child: TextField(
                controller: _password,
                textAlign: TextAlign.center,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'Password'),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextButton(
                onPressed: () {},
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.black,
                        // padding: EdgeInsets.all(55),
                        padding: EdgeInsets.symmetric(
                            horizontal: 150, vertical: 30)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const LoginUnsuccessfulPage()),
                      );
                    },
                    child: Text(
                      "SIGN IN",
                    )),
              ),
            ),
          ],
        ));
  }
}

class LoginUnsuccessfulPage extends StatelessWidget {
  const LoginUnsuccessfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SizedBox(height: 100),
            Container(
              width: 150,
              height: 150,
              child: Image.asset('./images/imageLoginUnsuccessful.png'),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
            ),
            Text(
              "UPS... couldn't Sign in",
              textAlign: TextAlign.center,
              textScaleFactor: 2,
              style: TextStyle(
                fontSize: 20.0,
                //  color: Colors.black,
              ),
            ),
            Text(
              "Your email and password don't match.\n Please, try again. ",
              textAlign: TextAlign.center,
              textScaleFactor: 1,
              style: TextStyle(
                  //color: Colors.black,
                  ),
            ),
            SizedBox(height: 500),
            Padding(
              padding: EdgeInsets.all(15),
              child: TextButton(
                onPressed: () {},
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.black,
                        // padding: EdgeInsets.all(55),
                        padding: EdgeInsets.symmetric(
                            horizontal: 200, vertical: 30)),
                    onPressed: () {
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Text(
                      "TRY AGAIN",
                    )),
              ),
            ),
          ],
        ));
  }
}
