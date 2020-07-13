import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:thesis_app/widget//chip.dart';
import 'package:thesis_app/widget//event_item.dart';
import 'package:thesis_app/widget/botnavbar.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}


final Color color = HexColor.fromHex('#FAF7E1a');
final dbRef = FirebaseDatabase.instance.reference().child("Events");
List list=new List();

class _HomePageState extends State<HomePage> {
  void initState(){
    dbRef.once().then((DataSnapshot snapshot){
      list.clear();
      Map<dynamic, dynamic> values = snapshot.value;
      values.forEach((key,values) {
        print(values);
        list.add(values);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            width: double.infinity,
                            child: Text('What\'s good in?',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                            margin: EdgeInsets.only(left: 20,right: 20,top: 35),
                          ),
                          Container(
                            width: double.infinity,
                            child: Text('Indonesia',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          child: ListView.builder(
                            itemCount: list.length,
                            itemBuilder: (BuildContext ctx, int index){
                              return EventItem(eventName: list[index]["eventName"],);
                            },
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
          bottomNavigationBar: BotNavBar(currIndex: 0,)
        ),
      )
    );
  }
}


extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}