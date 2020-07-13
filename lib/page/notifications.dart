import 'package:flutter/material.dart';
import 'package:thesis_app/widget/botnavbar.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(),
          bottomNavigationBar: BotNavBar(currIndex: 2,),
        ),
      ),
    );
  }
}
