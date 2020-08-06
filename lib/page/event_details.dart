import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class EventDetailsPage extends StatefulWidget {
  final event;
  EventDetailsPage({this.event});
  @override
  _EventDetailsPageState createState() => _EventDetailsPageState();
}

class _EventDetailsPageState extends State<EventDetailsPage> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: selectNotification);
  }

  Future selectNotification(String payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload);
    }
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AlertDialog(title: Text('Aye'),content: Text('Aye Content'),)),
    );
  }

  Duration timeDifference(){
    var dateEvent = DateTime(2020,8,3,17,50);
    var date = DateTime.now();
    var val  = dateEvent.difference(date);
    return val;
  }

  setNotifications() async{
    var duration = timeDifference();
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.Max, priority: Priority.High, ticker: 'ticker');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
//    await flutterLocalNotificationsPlugin.show(
//        0, 'plain title', 'plain body', platformChannelSpecifics,
//        payload: 'item x');
    await flutterLocalNotificationsPlugin.schedule(
        0,
        'scheduled title',
        'scheduled body',
        DateTime.now().add(duration),
        platformChannelSpecifics);
  }

  @override
  Widget build(BuildContext context) {
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
                              child: Text(widget.event['dates'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, ),)
                          ),
                        ],
                      )
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20,left: 10,right: 10),
                      alignment: Alignment.centerLeft,
                      child: Container(
                        child: Text(widget.event['eventName'],
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
                        child: Text(widget.event['address'],
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
                          icon: Icon(Icons.alarm),
                          label: Text(widget.event['times'])
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
                        child: Text(widget.event['description'],
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
                      onPressed: (){
                        setNotifications();
                      },
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
