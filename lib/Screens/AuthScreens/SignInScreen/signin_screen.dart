import 'package:ages/HelperFunctions/helper_functions.dart';
import 'package:ages/Screens/AuthScreens/ForgetPasswordScreen/forgotpassword_screen.dart';
import 'package:ages/Providers/email_password_provider.dart';
import 'package:ages/Screens/AuthScreens/SignUpScreen/signup_screen.dart';

import 'package:ages/Widgets/loading_alert.dart';

import 'package:ages/Widgets/text_widget.dart';
import 'package:ages/Widgets/textfield_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/button_widget.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool emailErrorvisible=false;
  bool passwordErrorvisible=false;
  late FocusNode emailFocusNode;
  late FocusNode passwordFocusNode;
  String? emailError;
  String? passwordError;
  EmailPasswordProvider? emailPasswordProvider;

  @override
  void initState() {
    emailPasswordProvider= Provider.of<EmailPasswordProvider>(context,listen: false);
    emailFocusNode=FocusNode();
    passwordFocusNode=FocusNode();
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
    passwordFocusNode.addListener(() {
      if(!passwordFocusNode.hasFocus){
        if(passwordController.text.isEmpty){
          setState(() {
            passwordError="please enter password";
            passwordErrorvisible=true;
          });
        }
        else if(passwordController.text.length<8){
          setState(() {
            passwordError="Password must be 8 characters long";
            passwordErrorvisible=true;
          });
        }
        else if(RegExp(r"\s").hasMatch(passwordController.text)){
          setState(() {
            passwordError="please enter password";
            passwordErrorvisible=true;
          });
        }
        else{
          setState(() {
            passwordErrorvisible=false;
          });
        }

      }
      else{
        setState(() {
          passwordErrorvisible=false;
        });
      }
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }



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
                 emailErrorvisible==true? SizedBox(height: size.height*0.02,):Container(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextFieldWidget(controller: passwordController,
                          textInputAction: TextInputAction.done,
                          focusNode: passwordFocusNode,
                          errortext: passwordErrorvisible == true ? passwordError : '',
                          onTap: (){
                            setState(() {
                              passwordErrorvisible=false;
                            });
                          },
                          prefixIcon: SvgPicture.asset(
                              "images/lock.svg",
                              width: 5,
                              height: 5,fit: BoxFit.scaleDown
                          ), hintText: "Enter Password"),
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
                        validate();
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
  validate(){
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
    else if(passwordController.text.isEmpty){
      setState(() {
        passwordError="please enter password";
        passwordErrorvisible=true;
      });
    }
    else if(passwordController.text.length<8){
      setState(() {
        passwordError="Password must be 8 characters long";
        passwordErrorvisible=true;
      });
    }
    else if(RegExp(r"\s").hasMatch(passwordController.text)){
      setState(() {
        passwordError="please enter password";
        passwordErrorvisible=true;
      });
    }
    else{
      // LoadingAlert(context: context);
      showloadingdialog.ShowLoadingDialog(context);
      emailPasswordProvider?.signInFunction(context: context,
          emailAddress: emailController.text,password: passwordController.text);

    }
  }

}
