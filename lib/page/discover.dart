import 'package:flutter/material.dart';
import 'package:thesis_app/page/serch_result.dart';
import 'package:thesis_app/widget/botnavbar.dart';




class DiscoverPage extends StatefulWidget {

  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

String _selectedCategory = "Any";
List category = ["Any","Culinary","Animal","Sports","Education","Music","Dance","Seminar","Tech", "Religion"];
TextEditingController distanceController = TextEditingController();

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomPadding: false,
          body: Container(
            width: double.infinity,
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(left: 20, right: 20,top: 50),
                    child: TextField(
                      autocorrect: true,
                      decoration: InputDecoration(
                        hintText: 'Search for...',
                        prefixIcon: Icon(Icons.search),
                        hintStyle: TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white12,
//                        enabledBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
//                          borderSide: BorderSide(color: Colors.green, width: 2),
//                        ),
//                        focusedBorder: OutlineInputBorder(
//                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
//                          borderSide: BorderSide(color: Colors.green, width: 2),
//                        ),
                      ),)
                ),
                Container(
                  padding: EdgeInsets.only(top: 25,left: 20,right: 20),
                  width: double.infinity,
                  child: Text('Category',style: TextStyle(fontSize: 18,),),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10,left: 20,right: 20),
                  width: double.infinity,
                  child: DropdownButton(
                      isExpanded: true,
                      value: _selectedCategory,
                      items: category.map((value){
                        return DropdownMenuItem(
                            child: Text(value),
                            value: value,
                        );
                      }).toList(),
                      onChanged: (value){
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                  )
                ),
                Container(
                  padding: EdgeInsets.only(top: 25,left: 20,right: 20),
                  width: double.infinity,
                  child: Text('Nearby events?',style: TextStyle(fontSize: 18,),),
                ),
                Container(
                    padding: EdgeInsets.only(top: 10,left: 20,right: 20),
                    width: double.infinity,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            flex : 2,
                            child: TextField(
                              autofocus: false,
                              controller: distanceController,
                              maxLength: 2,
                              decoration: InputDecoration(
                                hintText: "ex. 12",
                                counterText: "",
                              ),
                            )
                        ),
                        Expanded(
                            flex: 9,
                            child: Text("km")
                        )
                      ],
                    ),
                ),
                Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          padding: EdgeInsets.only(left: 30,right: 30,top: 20, bottom: 20),
                          onPressed: (){
                            int d;
                            if(distanceController.text == "")
                              d = 0;
                            if(distanceController.text != "")
                              d = int.parse(distanceController.text);

                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  SearchResultPage(
                                    distance: d,
                                  )
                            ));
                          },
                          color: Colors.redAccent,
                          child: Text('Find things to do..', style: TextStyle(color: Colors.white),),
                        ),
                      ),
                    ),
                )
              ],
            ),
          ),
          bottomNavigationBar: BotNavBar(currIndex: 1,)
        ),
      ),
    );
  }
}
