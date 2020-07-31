import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:thesis_app/firebase/authentication.dart';
import 'package:thesis_app/page/home.dart';
import 'package:thesis_app/page/login.dart';


class LoginSelectionPage extends StatefulWidget {
  @override
  _InstantLoginPageState createState() => _InstantLoginPageState();
}

class _InstantLoginPageState extends State<LoginSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            color: Colors.redAccent,
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RichText(
                  text: TextSpan(
                    text: 'Event ',
                    style: TextStyle(color: Colors.white, fontSize: 56),
                    children: <TextSpan>[
                      TextSpan(text: 'plaza', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24, color: Colors.black)),
                    ],
                  ),
                ),
                Text('The better way to improve your life',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white)),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: Builder(
                    builder: (context) => SignInButton(
                      Buttons.GoogleDark,
                      onPressed: () {
                        AuthMethod().googleSignIn()
                            .then((FirebaseUser user) => print(user))
                            .catchError((e) => print(e));
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Builder(
                    builder: (context) => SignInButton(
                      Buttons.Email,
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
