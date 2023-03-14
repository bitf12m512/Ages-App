import 'package:ages/Screens/AuthScreens/SetPasswordScreen/setpassword_screen.dart';
import 'package:ages/Providers/email_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../HelperFunctions/helper_functions.dart';
import '../../../Widgets/button_widget.dart';
import '../../../Widgets/loading_alert.dart';
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
  TextEditingController confilmpasswordController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  bool emailErrorvisible=false;
  bool confirmPasswordErrorvisible=false;
  bool passwordErrorvisible=false;
  late FocusNode emailFocusNode;
  late FocusNode confirmPasswordFocusNode;
  late FocusNode passwordFocusNode;
  String? emailError;
  String? confirmPasswordError;
  String? passwordError;
  EmailPasswordProvider? emailPasswordProvider;

  @override
  void initState() {
    emailPasswordProvider= Provider.of<EmailPasswordProvider>(context,listen: false);
    emailFocusNode=FocusNode();
    confirmPasswordFocusNode=FocusNode();
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
    confirmPasswordFocusNode.addListener(() {
      if(!confirmPasswordFocusNode.hasFocus){
        if(confilmpasswordController.text.isEmpty){
          setState(() {
            confirmPasswordError="Password doesn't match";
            confirmPasswordErrorvisible=true;
          });
        }
        else if(RegExp(r"\s").hasMatch(confilmpasswordController.text)){
          setState(() {
            confirmPasswordError="Password doesn't match";
            confirmPasswordErrorvisible=true;
          });
        }
        else if(confilmpasswordController.text.length<8){
          setState(() {
            confirmPasswordError="Password doesn't match";
            confirmPasswordErrorvisible=true;
          });
        }
        else if(confilmpasswordController.text!=passwordController.text){
          setState(() {
            confirmPasswordError="Password doesn't match";
            confirmPasswordErrorvisible=true;
          });
        }
        else{
          setState(() {
            confirmPasswordErrorvisible=false;
          });
        }

      }
      else{
        setState(() {
          confirmPasswordErrorvisible=false;
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
    confilmpasswordController.dispose();
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
            Image.asset(
              "images/image3.jpg",
              height: size.height,
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
                  emailErrorvisible == true ? SizedBox(height: size.height*0.01,):Container(),
                  TextFieldWidget(controller: passwordController,
                      textInputAction: TextInputAction.next,
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
                        height: 5,fit: BoxFit.scaleDown,
                      ), hintText: "Enter Password"),
                  passwordErrorvisible == true ? SizedBox(height: size.height*0.01,):Container(),
                  TextFieldWidget(controller: confilmpasswordController,
                      textInputAction: TextInputAction.done,
                      focusNode: confirmPasswordFocusNode,
                      errortext: confirmPasswordErrorvisible == true ? confirmPasswordError : '',
                      onTap: (){
                        setState(() {
                          confirmPasswordErrorvisible=false;
                        });
                      },
                      prefixIcon: SvgPicture.asset(
                          "images/lock.svg",
                          width: 5,
                          height: 5,fit: BoxFit.scaleDown
                      ), hintText: "Confirm Password"),
                  SizedBox(height: size.height*0.03,),
                  ButtonWidget(text: "SIGN UP", onPressed: () {
                  validate();
                  }
                  )


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
    else if(confilmpasswordController.text.isEmpty){
      setState(() {
        confirmPasswordError="Password doesn't match";
        confirmPasswordErrorvisible=true;
      });
    }
    else if(RegExp(r"\s").hasMatch(confilmpasswordController.text)){
      setState(() {
        confirmPasswordError="Password doesn't match";
        confirmPasswordErrorvisible=true;
      });
    }
    else if(confilmpasswordController.text.length<8){
      setState(() {
        confirmPasswordError="Password doesn't match";
        confirmPasswordErrorvisible=true;
      });
    }
    else if(confilmpasswordController.text!=passwordController.text){
      setState(() {
        confirmPasswordError="Password doesn't match";
        confirmPasswordErrorvisible=true;
      });
    }
    else{
      showloadingdialog.ShowLoadingDialog(context);
      emailPasswordProvider?.SignUpFunction(emailAddress: emailController.text,
          password:passwordController.text, context: context);
    }

  }
}
