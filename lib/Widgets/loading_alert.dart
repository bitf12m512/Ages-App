import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class showloadingdialog{
  static ShowLoadingDialog(context){
    var size=MediaQuery.of(context).size;
    return showDialog(
      context: context,
      barrierDismissible: false,
      useRootNavigator: false,
      // routeSettings: RouteSettings(),
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          content: Container(
            width: size.width,
            height: size.height * 0.2,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: size.height * 0.02,),

                Container(
                  width: size.width * 0.8,
                  child: Text('Please wait...',style: GoogleFonts.bebasNeue(
                    fontSize: 14,
                    color: Colors.black,
                    // fontWeight: FontWeight.bold
                  ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(
                  height: size.height * 0.01,
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}