import 'package:ages/HelperFunctions/helper_functions.dart';
import 'package:ages/Screens/AuthScreens/ForgetPasswordScreen/forgotpassword_screen.dart';
import 'package:ages/Screens/AuthScreens/SignUpScreen/signup_screen.dart';
import 'package:ages/Screens/HomeScreen/home_screen.dart';

import 'package:ages/Widgets/text_widget.dart';
import 'package:ages/Widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Widgets/button_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
           const Image(
             image: AssetImage("images/image2.jpg"),
             height: double.infinity,
             fit: BoxFit.fitHeight,
             gaplessPlayback: true,
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
              height: size.height,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child:  Column(
                children: [
                  SizedBox(height: size.height*0.02,),
                  Image.asset(
                    "images/ageslogo.png",
                    height: size.height*0.08,
                  ),
                  SizedBox(height: size.height*0.02,),
                  TextWidget(
                    text: "SIGN IN",
                    fontsize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  TextWidget(
                    text: "WELCOME BACK!",
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
                  SizedBox(height: size.height*0.02,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFieldWidget(controller: emailController,
                          textInputAction: TextInputAction.done,
                          prefixIcon: SvgPicture.asset(
                              "images/lock.svg",
                              width: 5,
                              height: 5,fit: BoxFit.scaleDown
                          ), hintText: "Enter Password"),
                      SizedBox(height: size.height*0.01,),
                      InkWell(
                        onTap: (){
                          HelperFunctions.moveToNextScreenWithPush(context,ForgotPasswordScreen());
                        },
                        child: TextWidget(
                          text: "FORGOT PASSWORD?",
                          fontsize: 16,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xffFFC803),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height*0.05,),
                  ButtonWidget(text: "SIGN IN", onPressed: (){
                    HelperFunctions.moveToNextScreenWithPush(context, HomeScreen());
                  }),





                ],
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: InkWell(
                  onTap: (){
                    HelperFunctions.moveToNextScreenWithPush(context, SignUpScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: RichText(
                      text: const TextSpan(
                        text: "DON'T HAVE AN ACCOUNT?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.normal,
                            color: Colors.white
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' SIGN UP!', style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffFFC803)
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
