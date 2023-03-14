import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';

class CurrentUserProvider extends ChangeNotifier{
  String? name;
  String? _profileUrl;
  String? email;


  String? get profileUrl => _profileUrl;

  set profileUrl(String? value) {
     _profileUrl = value;
     notifyListeners();
  }

  getCurrentUserData() async {
    final ref = FirebaseDatabase.instance.ref("users").child(
        FirebaseAuth.instance.currentUser!.uid);
    DatabaseEvent event = await ref.once();
    if (event.snapshot.exists) {
      Map<dynamic, dynamic> dataMap = Map.from(
          event.snapshot.value as Map<dynamic, dynamic>);
      profileUrl = dataMap['profileUrl'];
      email = dataMap['email'];
      name=dataMap['userName'];
    }
  }

}