import 'package:flutter/material.dart';
import 'package:mapbox_search_flutter/mapbox_search_flutter.dart';
import 'package:thesis_app/page/post_event.dart';

class SearchPage extends StatefulWidget {

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(child: Scaffold(
        body: MapBoxPlaceSearchWidget(
          popOnSelect: true,
          apiKey: "pk.eyJ1Ijoic3VoYWZlcmR5IiwiYSI6ImNrYzc2NXo3dzBlYmkydWsxYTB5ejZyMnoifQ.iAYJVKIDBZYLdlNtiflXeQ",
          limit: 10,
          searchHint: 'Your Hint here',
          onSelected: (place) {
            print(place.center);
            Navigator.pop(context, MaterialPageRoute(
                builder: (context) => PostEventPage()
            ));
          },
          context: context,
        ),
      )),
    );
  }

}



