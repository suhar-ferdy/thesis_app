import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';
import 'package:thesis_app/firebase/crud.dart';
import 'package:thesis_app/page/search.dart';


class PostEventPage extends StatefulWidget {
  _PostEventPageState createState() => _PostEventPageState();
}

var dates = '';
var times = '';
var placeData;
final f = new DateFormat('yyyy-MM-dd');
TextEditingController eventNameController = new TextEditingController();
TextEditingController descController = new TextEditingController();

class _PostEventPageState extends State<PostEventPage> {
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : SafeArea(
        child: Scaffold(
          body: ListView(
              children : [
                Container(
                  width:200,
                  height:200,
                  decoration : BoxDecoration(
                      image : DecorationImage(
                        fit : BoxFit.fill,
                        image: NetworkImage('https://picsum.photos/250?image=9',),
                      )
                  ),
                  child : Center(
                    child : FlatButton.icon(
                        onPressed : (){},
                        icon : Icon(Icons.add, color : Colors.white),
                        label : Text('Cover Image',
                            style: TextStyle(color : Colors.white)),
                        color : Colors.redAccent
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 20),
                  child : TextField(
                    controller: eventNameController,
                    decoration : InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Event name',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10,right: 10,top: 20),
                  child : TextField(
                    controller: descController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration : InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Event description',
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5,right: 5,top: 20,bottom: 10),
                  child: MapBoxPlaceSearchWidget(
                    apiKey: "pk.eyJ1Ijoic3VoYWZlcmR5IiwiYSI6ImNrYzc2NXo3dzBlYmkydWsxYTB5ejZyMnoifQ.iAYJVKIDBZYLdlNtiflXeQ",
                    limit: 10,
                    searchHint: 'Pick location',
                    onSelected: (place) {
                      print(place.center.runtimeType);
                      setState(() {
                        setState(() {
                          placeData = place;
                        });
                      });
                    },
                    context: context,
                  ),
                ),
                FlatButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(2018, 3, 5),
                          onConfirm: (date) {
                            setState(() {
                              dates = f.format(date).toString();
                            });

                          },
                          currentTime: DateTime.now(), locale: LocaleType.id);
                    },
                    child: Text(
                      'Pick date',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    )),
                Center(child: Text('$dates')),
                FlatButton(
                    onPressed: () {
                      DatePicker.showTimePicker(context,
                          showTitleActions: true,
                          onConfirm: (time) {
                            setState(() {
                              var h = time.hour;
                              var m = time.minute;
                              times = '$h : $m';
                            });

                          },
                          currentTime: DateTime.now(), locale: LocaleType.id);
                    },
                    child: Text(
                      'Pick time',
                      style: TextStyle(color: Colors.blue,fontSize: 18),
                    )),
                Center(child: Text('$times')),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 30),
                  child: Container(
                    width: double.infinity,
                    child: RaisedButton(
                      padding: EdgeInsets.only(left: 30,right: 30,top: 20, bottom: 20),
                      onPressed: (){
                        var data = {
                          "eventName" : eventNameController.text,
                          "description" : descController.text,
                          "address" : placeData.toString(),
                          "lat" : placeData.center[0],
                          "lng" : placeData.center[1],
                          "dates" : dates,
                          "times" : times,
                        };
                        CRUD().create(data);
                      },
                      color: Colors.redAccent,
                      child: Text('Post my event..', style: TextStyle(color: Colors.white),),
                    ),
                  ),
                )

              ]
          )
        ),
      ),

    );

  }
}