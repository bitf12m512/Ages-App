

import 'package:flutter/material.dart';

class HelperFunctions{


 static moveToNextScreen(BuildContext context,dynamic ScreenName){
   Navigator.pushReplacement(context,
       MaterialPageRoute(builder:
           (context) =>
           ScreenName
       )
   );
 }
 static moveToNextScreenWithPush(BuildContext context,dynamic ScreenName){
   Navigator.push(context,
       MaterialPageRoute(builder:
           (context) =>
       ScreenName
       )
   );
 }



}