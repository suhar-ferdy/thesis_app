import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class EventDetailsPage extends StatefulWidget {

  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  @override
  Widget build(BuildContext context) {
    String description =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Column(
            children:[
              Expanded(
                flex: 5,
                child: ListView(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTiTm2hp-PlhDSLBaE21tEasimbME4Z94X3kQ&usqp=CAU')
                          ),
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.black
                              )
                          )
                      ),
                      height: MediaQuery.of(context).size.height * 40/100,
                    ),
                    Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.width * 55/100,top: 10,right: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.date_range),
                          Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text('Date',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, ),)
                          ),
                        ],
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text('Event Name',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent
                          ),
                        ),
                      ),

                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text('Address Location',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent
                          ),
                        ),
                      ),

                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: FlatButton.icon(
                          onPressed: (){},
                          icon: Icon(Icons.local_atm),
                          label: Text('Set price')
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10,top: 10),
                      child: Wrap(
                        spacing: 5,
                        direction: Axis.horizontal,
                        children: <Widget>[

                          Text('#Tech'),
                          Text('#Religion'),
                          Text('#Fashion'),
                          Text('#Other'),

                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 10, right: 10),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(description,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.only(left: 30,right: 30,top: 20, bottom: 20),
                      onPressed: (){},
                      color: Colors.redAccent,
                      child: Text('Add to favourites..', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
              )

            ]
          ),
        ),
      ),
    );
  }
}
