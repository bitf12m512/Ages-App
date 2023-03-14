import 'package:ages/Widgets/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../HelperFunctions/helper_functions.dart';
import '../Screens/AuthScreens/SignInScreen/signin_screen.dart';

class ResetLink extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  dynamic? screenname;

   ResetLink({Key? key,required this.screenname, required this.image, required this.title, required this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Container(
          height: size.height * 0.5,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12)
          ),
          padding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
          margin: EdgeInsets.symmetric(horizontal: 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(image,
                  height: size.height * 0.18,),
              ),
              SizedBox(height: size.height * 0.02,),
              Text(title,style: GoogleFonts.bebasNeue(
                fontSize: 24,
                color: Colors.black,
              ),),
              SizedBox(height: size.height * 0.01,),
              Text(subtitle,style: GoogleFonts.dmSans(
                fontSize: 15,
                color: Color(0xffA1A1A1),
              ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.02,),

              ButtonWidget(text: "Verify", onPressed: (){
                HelperFunctions.moveToNextScreen(context, screenname);
              })
            ],
          ),
        ),
      ),
    );
  }
}