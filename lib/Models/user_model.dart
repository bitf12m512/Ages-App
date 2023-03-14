class UserModel{
  String? profileUrl;
  String? email;
  String? uid;
  int? timestamp;
  String? userName;

  UserModel(
      {this.profileUrl, this.email, this.uid, this.timestamp, this.userName});

  Map<String, dynamic> toMap() {
    return {
      'profileUrl': this.profileUrl,
      'email': this.email,
      'uid': this.uid,
      'timestamp': this.timestamp,
      'userName': this.userName,
    };
  }

  factory UserModel.fromMap(Map map) {
    return UserModel(
      profileUrl: map['profileUrl'] as String?,
      email: map['email'] as String?,
      uid: map['uid'] as String?,
      timestamp: map['timestamp'] as int?,
      userName: map['userName'] as String?,
    );
  }
}