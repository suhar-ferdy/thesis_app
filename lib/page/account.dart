import 'package:flutter/material.dart';
import 'package:thesis_app/firebase/authentication.dart';
import 'package:thesis_app/page/post_event.dart';
import 'package:thesis_app/widget/botnavbar.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              children: <Widget>[
                Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            width: 150.0,
                            height: 150.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        "https://i.imgur.com/nXG491Qb.jpg")
                                )
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text("John Doe", textScaleFactor: 1.5, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),),
                        )
                      ],
                    )
                ),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.only(top: 30),
                        child: ListView(
                          children: <Widget>[
                            FlatButton.icon(
                              onPressed: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => PostEventPage())
                                );
                              },
                              icon: Icon(Icons.add, size: 25,),
                              label: Text('Post Event', style: TextStyle(fontSize: 15),),
                            ),
                            FlatButton.icon(
                              onPressed: (){
                                AuthMethod().signOut(context);
                              },
                              icon: Icon(Icons.exit_to_app, size: 25,),
                              label: Text('Logout', style: TextStyle(fontSize: 15),),
                            ),

                          ],
                        )
                    )
                )
              ],
            ),
          ),
          bottomNavigationBar: BotNavBar(currIndex: 3,)
        ),
      ),
    );
  }
}
