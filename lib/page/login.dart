import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thesis_app/page/register.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

String _email,_password;

class _LoginPageState extends State<LoginPage> {
  @override

  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    TextEditingController emailController = new TextEditingController();
    TextEditingController passController = new TextEditingController();
    bool validEmail = false;
    bool validPass = false;
    final FirebaseAuth _auth = FirebaseAuth.instance;


    String emailValidator(String value){
      String msg ="";
      if(EmailValidator.validate(value) == false && value.isNotEmpty){
        msg = "Invalid email address";
        validEmail = false;
      }
      if(value.isEmpty){
        msg = "E\-mail can\'t be empty";
        validEmail = false;
      }
      if(EmailValidator.validate(value) == true && value.isNotEmpty){
        msg = null;
        validEmail = true;
      }
      return msg;
    }
    String passValidator(String value){
      String msg = "";
      if(passController.text.length < 6){
        msg = "Password atleast 6 characters";
        validPass = false;
      }
      else{
        msg = null;
        validPass = true;
      }

      return msg;
    }

    Widget _loginTitle(){
      return Padding(
        padding: EdgeInsets.only(bottom: 20, left: 30, right: 30, top: 100),
        child: Container(
            width: double.infinity,
            child: Text('Login', style: TextStyle(fontSize: 36), textAlign: TextAlign.left,)
        ),
      );
    }

    Widget _formEmailInput(){
      return Padding(
        padding: EdgeInsets.only(left: 30,right: 30),
        child: TextFormField(
          controller: emailController,
          autofocus: false,
          maxLines: 1,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'E-mail',
          ),
          validator: emailValidator,
        ),
      );
    }

    Widget _formPasswordInput(){
      return Padding(
        padding: EdgeInsets.only(left: 30,right: 30),
        child: TextFormField(
          controller: passController,
          autofocus: false,
          maxLines: 1,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
          ),
          validator: passValidator,
        ),
      );
    }

    Widget _forgotPassword(){
      return Padding(
        padding: EdgeInsets.only(top: 10, bottom: 30, left: 30),
        child: Container(
            width: double.infinity,
            child: Text('Forgot password?', style: TextStyle(fontSize: 16), textAlign: TextAlign.left,)
        ),
      );
    }

    Widget _loginButton(){
      return Container(
        alignment: Alignment.centerRight,
        child: Material(
          color: Colors.blueAccent,
          child: InkWell(
              onTap: (){
                if (_formKey.currentState.validate()) {
                    if(validEmail == true && validPass == true){
                      _auth.signInWithEmailAndPassword(
                        email: emailController.text,
                        password: passController.text,
                      ).whenComplete((){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                      });
                    }
                }
              },
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
                child: Text('Let\'s Go!', style: TextStyle(color: Colors.white),),
              )
          ),
        ),
      );
    }

    Widget _registerGuide(){
      return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 60, left: 50, right: 50, bottom: 20),
        child: Center(child: Text('Don\'t have account yet?', style: TextStyle(fontSize: 16), textAlign: TextAlign.left,)),
      );
    }

    Widget _registerButton(){
      return Container(
        alignment: Alignment.center,
        child: Material(
          color: Colors.redAccent,
          child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              child: Container(
                padding: EdgeInsets.only(top: 20, left: 50, right: 50, bottom: 20),
                child: Text('Here!', style: TextStyle(color: Colors.white),),
              )
          ),
        ),
      );
    }

    Widget _showForm(){
      return new Container(
          child: new Form(
            key: _formKey,
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                _loginTitle(),
                _formEmailInput(),
                _formPasswordInput(),
                _forgotPassword(),
                _loginButton(),
                _registerGuide(),
                _registerButton(),
              ],
            ),
          ));
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[
              _showForm(),
            ],
          ),
        ),

      ),
    );
  }

}
