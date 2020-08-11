import 'package:flutter/material.dart';
import 'package:thesis_app/page/event_details.dart';

class EventItem extends StatelessWidget {
  final event;
  EventItem({this.event});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, bottom: 10,left: 20,right: 20),
      child: Material(
        child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => EventDetailsPage(event: event,)));
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
                          padding: EdgeInsets.only(left: 10,bottom: 10,top: 5),
                          width: double.infinity,
                          child: Text(event['eventName'] == null ? '' : event['eventName'],style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: double.infinity,
                          child: Text(event['address'] == null ? '' : event['address'],style: TextStyle(fontSize: 14, color: Colors.blueAccent),),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          width: double.infinity,
                          child: Text(event['category'] == null ? '' : event['category'],style: TextStyle(fontSize: 12),),
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
