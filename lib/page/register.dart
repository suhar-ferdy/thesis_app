import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thesis_app/page/home.dart';
import 'package:thesis_app/page/login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}


class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {

    final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
    TextEditingController emailController = new TextEditingController();
    TextEditingController passController = new TextEditingController();
    TextEditingController confirmPassController = new TextEditingController();
    bool validEmail = false;
    bool passMatch = false;
    final FirebaseAuth _auth = FirebaseAuth.instance;

    void loginValidate() async{
      final FormState form = _formKeyRegister.currentState;
      if(_formKeyRegister.currentState.validate()){
        form.save();
        if(passMatch == true && validEmail == true){
          _auth.createUserWithEmailAndPassword(
            email: emailController.text,
            password: passController.text,
          ).whenComplete((){
          });
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));

        }
      }
    }

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
        passMatch = false;
      }
      else
        msg = null;
      return msg;
    }
    String confirmPassValidator(String value){
      String msg = "";
      if(value.isEmpty){
        msg = "Confirm Password can\'t be empty";
        passMatch = false;
      }
      if(passController.text != confirmPassController.text){
        msg = "Password not match";
        passMatch = false;
      }
      if(passController.text == confirmPassController.text && value.isNotEmpty){
        msg = null;
        passMatch = true;
      }
      return msg;
    }

    Widget _registerTitle(){
      return Padding(
        padding: EdgeInsets.only(bottom: 20, left: 30, right: 30, top: 50),
        child: Container(
            width: double.infinity,
            child: Text('Register', style: TextStyle(fontSize: 36), textAlign: TextAlign.left,)
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

    Widget _formConfirmPasswordInput(){
      return Padding(
        padding: EdgeInsets.only(left: 30,right: 30),
        child: TextFormField(
          controller: confirmPassController,
          autofocus: false,
          maxLines: 1,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Confirm Password',
          ),
          validator: confirmPassValidator,
        ),
      );
    }

    Widget _registerButton(){
      return Container(
        margin: EdgeInsets.only(top: 30),
        alignment: Alignment.centerRight,
        child: Material(
          color: Colors.redAccent,
          child: InkWell(
              onTap: loginValidate,
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
            key: _formKeyRegister,
            child: new ListView(
              shrinkWrap: true,
              children: <Widget>[
                _registerTitle(),
                _formEmailInput(),
                _formPasswordInput(),
                _formConfirmPasswordInput(),
                _registerButton(),

              ],
            ),
          )
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Colors.black,),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ),
          resizeToAvoidBottomPadding: false,
          body: Stack(
            children: <Widget>[
              _showForm()
            ],
          ),
        ),

      ),
    );
  }
}
