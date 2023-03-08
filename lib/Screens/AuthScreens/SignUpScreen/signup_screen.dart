import 'package:ages/Screens/AuthScreens/SetPasswordScreen/setpassword_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../HelperFunctions/helper_functions.dart';
import '../../../Widgets/button_widget.dart';
import '../../../Widgets/text_widget.dart';
import '../../../Widgets/textfield_widget.dart';
import '../SignInScreen/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "images/image3.jpg",
              height: size.height,
              width: size.width,
              fit: BoxFit.fitHeight,
            ),
            Container(
              color: Colors.black.withOpacity(0.6),
              height: size.height,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
              child: Column(
                children: [
                  SizedBox(height: size.height*0.02,),
                  Image.asset(
                    "images/ageslogo.png",
                    height: size.height*0.08,
                  ),
                  SizedBox(height: size.height*0.02,),
                  TextWidget(
                    text: "SIGN UP",
                    fontsize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  TextWidget(
                    text: "LET'S CREATE YOUR ACCOUNT!",
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
                  ButtonWidget(text: "Send Link", onPressed: (){
                    HelperFunctions.moveToNextScreenWithPush(context, SetPasswordScreen());
                  })


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
                    child: InkWell(
                      onTap: (){
                        HelperFunctions.moveToNextScreenWithPush(context, const SignInScreen());
                      },
                      child: RichText(
                        text: const TextSpan(
                          text: "ALREADY HAVE AN ACCOUNT?",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffA1A1A1)
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: ' SIGN IN!', style: TextStyle(
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
            ),
          ],
        )
      ),
    );
  }
}