import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';

class ImageUploadProvider extends ChangeNotifier{
  final dio = Dio();
  String? imageUrl;
  final FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();
  void request({required BuildContext context,required String file}) async {
    FormData formData = FormData.fromMap({
      "file": await  MultipartFile.fromFile(file, filename:file),
    });
    var response = await dio.post('https://codexiatech.dev/ylyt/upload.php', data: formData);
    Map valueMap = response.data;
    imageUrl=valueMap["fileUrl"];
    ref.child("users").child(auth.currentUser!.uid).update({
      "profileUrl":imageUrl,
    });
    notifyListeners();
  }

}