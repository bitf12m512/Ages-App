import 'dart:async';

import 'package:ages/HelperFunctions/helper_functions.dart';
import 'package:ages/Screens/AuthScreens/SignInScreen/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3),
            ()=> HelperFunctions.moveToNextScreen(context, SignInScreen()) );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "images/Image1.jpg",
            height: size.height,
            fit: BoxFit.fitHeight,
          ),
          Container(
            color: Colors.black.withOpacity(0.6),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/ageslogo.png",
                  height: size.height*0.12,
                ),
                SizedBox(height: size.height*0.01,),
                const Text("ACTIVELY AGING \nEUROPEAN\n SENIORS",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                        fontSize: 25,
                        fontFamily: "times new roman",
                        fontWeight: FontWeight.normal,
                          color: Colors.white,
                      )


                )


              ],
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: size.height,
                color: Colors.white.withOpacity(0.5),
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "images/eu-project.svg",
                ),
              ),
            ),
          ),

          // SvgPicture.asset(
          //   "images/ageslogo.svg",
          // ),
        ],
      )
    );
  }
}
