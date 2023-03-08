import 'package:ages/HelperFunctions/helper_functions.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../Widgets/button_widget.dart';
import '../../../Widgets/text_widget.dart';
import '../../../Widgets/textfield_widget.dart';
import '../../HomeScreen/home_screen.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({Key? key}) : super(key: key);

  @override
  _SetPasswordScreenState createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  TextEditingController confilmpasswordController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset(
              "images/image4.jpg",
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
                      Text(""),
                      Text("")
                    ],
                  ),
                  SizedBox(height: size.height*0.02,),
                  TextWidget(
                    text: "SET PASSWORD",
                    fontsize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  TextWidget(
                    text: "LET'S SECURE YOUR ACCOUNT!",
                    fontsize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),
                  SizedBox(height: size.height*0.03,),
                  TextFieldWidget(controller: passwordController,
                      textInputAction: TextInputAction.next,
                      prefixIcon: SvgPicture.asset(
                        "images/lock.svg",
                        width: 5,
                        height: 5,fit: BoxFit.scaleDown,
                      ), hintText: "Enter Password"),
                  SizedBox(height: size.height*0.02,),
                  TextFieldWidget(controller: confilmpasswordController,
                      textInputAction: TextInputAction.done,
                      prefixIcon: SvgPicture.asset(
                          "images/lock.svg",
                          width: 5,
                          height: 5,fit: BoxFit.scaleDown
                      ), hintText: "Confirm Password"),
                  SizedBox(height: size.height*0.05,),
                  ButtonWidget(text: "SIGN UP", onPressed: (){
                    HelperFunctions.moveToNextScreenWithPush(context, HomeScreen());
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
