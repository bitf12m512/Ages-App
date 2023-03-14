
import 'package:ages/Models/user_model.dart';

class CommunityChatModel{
String? msg;
int? timestamp;
Map? likes;
bool? replied;
String? uid;
UserModel? userModel;
String? key;
bool? isliked;
String? comment;


CommunityChatModel(
      {this.msg,
      this.timestamp,
      this.likes,
      this.replied,
      this.uid,
      this.userModel,
        this.isliked=false,
        this.comment,
      this.key,});

Map<String, dynamic> toMap() {
    return {
      'msg': this.msg,
      'timestamp': this.timestamp,
      'likes': this.likes,
      'replied': this.replied,
      'uid': this.uid,
      'key': this.key,
      'comment':this.comment,

    };
  }

  factory CommunityChatModel.fromMap(Map map) {
    return CommunityChatModel(
      msg: map['msg'] as String?,
      timestamp: map['timestamp'] as int?,
      likes: map['likes'] as Map?,
      replied: map['replied'] as bool?,
      uid: map['uid'] as String?,
      key: map['key'] as String?,
      comment: map['comment'] as String?

    );
  }
}