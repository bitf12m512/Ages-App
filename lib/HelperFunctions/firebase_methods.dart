import 'package:ages/Models/community_chat_model.dart';
import 'package:ages/Models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:collection/collection.dart';

class FirebaseMethods extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference reference = FirebaseDatabase.instance.ref();
  List<CommunityChatModel> _cimmunityChatList = [];
  List<UserModel> userslist = [];


  List<CommunityChatModel> get cimmunityChatList => _cimmunityChatList;

  set cimmunityChatList(List<CommunityChatModel> value) {
    _cimmunityChatList = value;
     notifyListeners();
  }

  sendMessagedata({required String msg, required bool replayed}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child(
        "communityChat").push();
    int servertime = await getCurrentTime();
    CommunityChatModel chatModel = CommunityChatModel(
      key: ref.key,
      timestamp: servertime,
      uid: auth.currentUser!.uid,
      msg: msg,
      replied: replayed,
      likes: {
        "count": 0
      },
    );
    await ref.set(chatModel.toMap());
  }
  sendcommentdata({required String msg, required bool replayed,required String comment}) async {
    DatabaseReference ref = FirebaseDatabase.instance.ref().child(
        "communityChat").push();
    int servertime = await getCurrentTime();
    CommunityChatModel chatModel = CommunityChatModel(
      key: ref.key,
      timestamp: servertime,
      uid: auth.currentUser!.uid,
      msg: msg,
      comment:comment ,
      replied: replayed,
    );
    await ref.set(chatModel.toMap());
  }

  Future<int> getCurrentTime() async {
    await FirebaseDatabase.instance.ref().child("currentTime").set({
      "timeStamp": ServerValue.timestamp
    });
    int timeStamp = 0;
    var event = await FirebaseDatabase.instance.ref()
        .child("currentTime")
        .once();
    if (event.snapshot.value != null) {
      final myMap = Map<dynamic, dynamic>.from(
          event.snapshot.value as Map<dynamic, dynamic>);
      timeStamp = myMap["timeStamp"];
    }
    return timeStamp;
  }

  getMessageList({required String senderid}) {
    reference
        .child("communityChat")
        .onValue
        .listen((event) async {
      if (event.snapshot.exists) {
        List<CommunityChatModel> chatMsgList = [];
        Map<dynamic, dynamic> chatMap = Map.from(
            event.snapshot.value as Map<dynamic, dynamic>);
        if (chatMap.values.isNotEmpty) {
          for (int i = 0; i < chatMap.length; i++) {
            final mapData = chatMap[chatMap.keys.toList()[i]];
            CommunityChatModel communityChatModel =
            CommunityChatModel.fromMap(mapData);
            communityChatModel.userModel = await findUser(communityChatModel.uid??"");
            chatMsgList.add(communityChatModel);
          }
          cimmunityChatList = chatMsgList;
          cimmunityChatList.sort((a, b) =>
              b.timestamp!.compareTo(a.timestamp!));
          for (int i = 0; i < cimmunityChatList.length; i++) {
            List<String> ligeked=[];
            if(cimmunityChatList[i].likes?["likedBy"]!=null){
              ligeked=List<String>.from(cimmunityChatList[i].likes?["likedBy"] as List<dynamic>);
            }
            if (ligeked.any((element) => element == senderid)) {
              cimmunityChatList[i].isliked=true;
              notifyListeners();
            }
          }
          notifyListeners();
        }
      }
    });
  }

  updateLikes({required String key, required String senderid}) async {
    int count = 0;
    List<String> likedByIds = [];
    DatabaseEvent communitychat = await reference.child("communityChat").child(
        key.toString()).child("likes")
        .once();
    if (communitychat.snapshot.exists) {
      Map<dynamic, dynamic> map = Map<dynamic, dynamic>.from(
          communitychat.snapshot.value as Map<dynamic, dynamic>);
      count = map['count'];
      if (map['likedBy'] != null) {
        likedByIds = List<String>.from(map['likedBy']);
        print("ID ${likedByIds.first}");
      }
      likedByIds.add(senderid);
      reference.child("communityChat").child(key.toString())
          .child("likes")
          .update(
          {
            "likedBy": likedByIds,
            "count": count + 1,
          });
    }
  }

  getallUsers() async {
    final ref = FirebaseDatabase.instance.ref("users");
    DatabaseEvent event = await ref.once();
    if (event.snapshot.exists) {
      Map<dynamic, dynamic> dataMap = Map.from(
          event.snapshot.value as Map<dynamic, dynamic>);
      for (int i = 0; i < dataMap.length; i++) {
        final mapData = dataMap[dataMap.keys.toList()[i]];

        UserModel userModel=UserModel.fromMap(mapData);
        userslist.add(userModel);
        print("USERLIST ${userslist.first.email}");
      }



    }
  }

 Future<UserModel?> findUser(String uid) async{
    if(userslist.isEmpty){
      await getallUsers();
    }
   UserModel? user = userslist.firstWhereOrNull((element) => element.uid == uid);
    return user;
  }
}