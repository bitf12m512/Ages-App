import 'package:ages/Screens/AuthScreens/SetNewPasswordScreen/setnewpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../HelperFunctions/helper_functions.dart';
import '../../../Widgets/button_widget.dart';
import '../../../Widgets/text_widget.dart';
import '../../../Widgets/textfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "images/Image1.jpg",
              height: size.height,
              fit: BoxFit.fitHeight,
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
              height: size.height,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child:  Column(
                children: [
                  SizedBox(height: size.height*0.02,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                      onTap:(){
                      Navigator.pop(context);
                       },
                        child: SvgPicture.asset(
                          "images/back.svg",
                          height: size.height*0.05,
                        ),
                      ),
                      Image.asset(
                        "images/ageslogo.png",
                        height: size.height*0.08,
                      ),
                      const Text(""),
                      const Text("")
                    ],
                  ),
                  SizedBox(height: size.height*0.02,),
                  TextWidget(
                    text: "FORGOT PASSWORD?",
                    fontsize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  TextWidget(
                    text: "ENTER REGISTERED EMAIL TO RECOVER ACCOUNT!",
                    fontsize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  SizedBox(height: size.height*0.03,),
                  TextFieldWidget(controller: emailController,
                      textInputAction: TextInputAction.next,
                      prefixIcon: SvgPicture.asset(
                        "images/mail.svg",
                        width: 5,
                        height: 5,fit: BoxFit.scaleDown,
                      ), hintText: "Enter Email"),
                  SizedBox(height: size.height*0.03,),
                  ButtonWidget(text: "SEND LINK", onPressed: (){
                    HelperFunctions.moveToNextScreenWithPush(context, const SetNewPasswordScreen());
                  })


                ],
              ),
            ),




          ],
        )


      ),
    );
  }
}
