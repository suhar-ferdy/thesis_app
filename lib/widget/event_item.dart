import 'package:flutter/material.dart';
import 'package:thesis_app/page/event_details.dart';

class EventItem extends StatelessWidget {
  String eventName;
  String address;
  double lng;
  double lat;
  String date;
  String time;
  String category;
  EventItem({this.eventName});
  @override
  Widget build(BuildContext context) {
    String name = eventName;
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 10,left: 20,right: 20),
      child: Material(
        child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsPage()));
            },
            child: Row(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTiTm2hp-PlhDSLBaE21tEasimbME4Z94X3kQ&usqp=CAU')
                      )
                  ),
                  width: MediaQuery.of(context).size.width * 40/100,
                  height: 150,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(top: 10,bottom: 40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(20), bottomRight: Radius.circular(20))
                    ),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 10,bottom: 15,top: 5),
                          width: double.infinity,
                          child: Text(eventName == null ? '' : eventName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: double.infinity,
                          child: Text('Event Organizer',style: TextStyle(fontSize: 12),),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: double.infinity,
                          child: Text('Distance',style: TextStyle(fontSize: 12),),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
        ),
      ),

    );
  }
}
