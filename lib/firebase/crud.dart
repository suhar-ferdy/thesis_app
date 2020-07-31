import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class CRUD {

  void create(var data) async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    FirebaseDatabase.instance.reference().child('Events').child(data["eventName"]).
    set(data);
  }

}