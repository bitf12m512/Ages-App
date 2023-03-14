import 'package:ages/Models/user_model.dart';
import 'package:ages/Widgets/loading_alert.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../HelperFunctions/helper_functions.dart';
import '../Widgets/reset_link_dialog.dart';
import '../Screens/HomeScreen/home_screen.dart';

class EmailPasswordProvider extends ChangeNotifier{
  final FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();


  SignUpFunction({required String emailAddress,required String password,required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress.toString(),
        password: password.toString(),
      );
      final user=FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      UserModel userModel=UserModel(
         uid: auth.currentUser!.uid,
         timestamp: DateTime.now().millisecondsSinceEpoch,
         email: credential.user!.email,
      );
     await ref.child("users").child(auth.currentUser!.uid).set(userModel.toMap());
      Navigator.pop(context);
      HelperFunctions.moveToNextScreen(context,  ResetLink(
        image: "images/linksend.svg",
        title: 'Verification Link Sent',
        subtitle: 'A verification link has been sent to your email verify first and then procced toward login.',
        screenname: const HomeScreen(),
      ));

      // HelperFunctions.moveToNextScreen(context, HomeScreen());
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  signInFunction({required String emailAddress,required String password,required BuildContext context}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailAddress,
          password: password
      );
      Navigator.pop(context);
      HelperFunctions.moveToNextScreen(context, HomeScreen());
      notifyListeners();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Navigator.pop(context);
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }




}