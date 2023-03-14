import 'package:ages/Screens/AuthScreens/SetNewPasswordScreen/setnewpassword_screen.dart';
import 'package:ages/Screens/AuthScreens/SignInScreen/signin_screen.dart';
import 'package:ages/Widgets/reset_link_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  bool emailErrorvisible=false;
  late FocusNode emailFocusNode;
  String? emailError;
  @override
  void initState() {
    emailFocusNode=FocusNode();
    emailFocusNode.addListener(() {
      if(!emailFocusNode.hasFocus){
        if(emailController.text.isEmpty){
          setState(() {
            emailErrorvisible=true;
            emailError="please enter valid email address";
          });
        }
        else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailController.text)){
          setState(() {
            emailErrorvisible=true;
            emailError="please enter valid email address";
          });
        }
        else{
          setState(() {
            emailErrorvisible=false;
          });
        }
      }
      else{
        setState(() {
          emailErrorvisible=false;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
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
                      textInputAction: TextInputAction.done,
                      focusNode: emailFocusNode,
                      errortext: emailErrorvisible == true ? emailError : '',
                      onTap: (){
                        setState(() {
                          emailErrorvisible=false;
                        });
                      },
                      prefixIcon: SvgPicture.asset(
                        "images/mail.svg",
                        width: 5,
                        height: 5,fit: BoxFit.scaleDown,
                      ), hintText: "Enter Email"),
                  SizedBox(height: size.height*0.03,),
                  ButtonWidget(text: "SEND LINK", onPressed: (){
                    print("hhkkjkk");
                    if(emailController.text.isEmpty){
                      setState(() {
                        emailErrorvisible=true;
                        emailError="please enter valid email address";
                      });
                    }
                    else if(!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(emailController.text)){
                      setState(() {
                        emailErrorvisible=true;
                        emailError="please enter valid email address";
                      });
                    }
                    else{
                      FirebaseAuth.instance.sendPasswordResetEmail(
                        email: emailController.text,)
                          .catchError((onError) => print('Error sending email verification $onError'))
                          .then((value) =>  HelperFunctions.moveToNextScreen(context,  ResetLink(
                        image: "images/linksend.svg",
                         title: 'Verification Link Sent',
                        subtitle: 'A verification link has been sent to your email verify first and then procced toward login.',
                        screenname: const SignInScreen(),
                      )));
                   }

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
