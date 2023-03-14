//
// import 'package:ages/Widgets/loading_alert.dart';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import '../../../Widgets/button_widget.dart';
// import '../../../Widgets/text_widget.dart';
// import '../../../Widgets/textfield_widget.dart';
// import '../SignUpScreen/email_password_provider.dart';
//
// class SetPasswordScreen extends StatefulWidget {
//   const SetPasswordScreen({Key? key}) : super(key: key);
//
//   @override
//   _SetPasswordScreenState createState() => _SetPasswordScreenState();
// }
//
// class _SetPasswordScreenState extends State<SetPasswordScreen> {
//   TextEditingController confilmpasswordController=TextEditingController();
//   TextEditingController passwordController=TextEditingController();
//
//    late FocusNode confirmPasswordFocusNode;
//    late FocusNode passwordFocusNode;
//
//    bool confirmPasswordErrorvisible=false;
//    bool passwordErrorvisible=false;
//
//    String? confirmPasswordError;
//    String? passwordError;
//
//   EmailPasswordProvider? emailPasswordProvider;
//
//
//    @override
//   void initState() {
//      emailPasswordProvider= Provider.of<EmailPasswordProvider>(context,listen: false);
//     confirmPasswordFocusNode=FocusNode();
//     passwordFocusNode=FocusNode();
//     passwordFocusNode.addListener(() {
//       if(!passwordFocusNode.hasFocus){
//         if(passwordController.text.isEmpty){
//           setState(() {
//             passwordError="please enter password";
//             passwordErrorvisible=true;
//           });
//         }
//         else if(passwordController.text.length<8){
//           setState(() {
//             passwordError="Password must be 8 characters long";
//             passwordErrorvisible=true;
//           });
//         }
//         else if(RegExp(r"\s").hasMatch(passwordController.text)){
//           setState(() {
//             passwordError="please enter password";
//             passwordErrorvisible=true;
//           });
//         }
//         else{
//           setState(() {
//             passwordErrorvisible=false;
//           });
//         }
//
//       }
//       else{
//         setState(() {
//           passwordErrorvisible=false;
//         });
//       }
//     });
//     confirmPasswordFocusNode.addListener(() {
//       if(!confirmPasswordFocusNode.hasFocus){
//         if(confilmpasswordController.text.isEmpty){
//           setState(() {
//             confirmPasswordError="Password doesn't match";
//             confirmPasswordErrorvisible=true;
//           });
//         }
//         else if(RegExp(r"\s").hasMatch(confilmpasswordController.text)){
//           setState(() {
//             confirmPasswordError="Password doesn't match";
//             confirmPasswordErrorvisible=true;
//           });
//         }
//         else if(confilmpasswordController.text.length<8){
//           setState(() {
//             confirmPasswordError="Password doesn't match";
//             confirmPasswordErrorvisible=true;
//           });
//         }
//         else if(confilmpasswordController.text!=passwordController.text){
//           setState(() {
//             confirmPasswordError="Password doesn't match";
//             confirmPasswordErrorvisible=true;
//           });
//         }
//         else{
//           setState(() {
//             confirmPasswordErrorvisible=false;
//           });
//         }
//
//       }
//       else{
//         setState(() {
//           confirmPasswordErrorvisible=false;
//         });
//       }
//     });
//      // TODO: implement initState
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     passwordController.dispose();
//     confilmpasswordController.dispose();
//      // TODO: implement dispose
//     super.dispose();
//   }
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     var size=MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Image.asset(
//               "images/image4.jpg",
//               height: size.height,
//               fit: BoxFit.fitHeight,
//             ),
//             Container(
//               color: Colors.black.withOpacity(0.6),
//               height: size.height,
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
//               child: Column(
//                 children: [
//                   SizedBox(height: size.height*0.02,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       InkWell(
//                         onTap:(){
//                           Navigator.pop(context);
//                         },
//                         child: SvgPicture.asset(
//                           "images/back.svg",
//                           height: size.height*0.05,
//                         ),
//                       ),
//                       Image.asset(
//                         "images/ageslogo.png",
//                         height: size.height*0.08,
//                       ),
//                       Text(""),
//                       Text("")
//                     ],
//                   ),
//                   SizedBox(height: size.height*0.02,),
//                   TextWidget(
//                     text: "SET PASSWORD",
//                     fontsize: 30,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.white,
//                   ),
//                   TextWidget(
//                     text: "LET'S SECURE YOUR ACCOUNT!",
//                     fontsize: 16,
//                     fontWeight: FontWeight.normal,
//                     color: Colors.white,
//                   ),
//                   SizedBox(height: size.height*0.03,),
//                   TextFieldWidget(controller: passwordController,
//                       textInputAction: TextInputAction.next,
//                       focusNode: passwordFocusNode,
//                       errortext: passwordErrorvisible == true ? passwordError : '',
//                       onTap: (){
//                       setState(() {
//                       passwordErrorvisible=false;
//                       });
//                       },
//                       prefixIcon: SvgPicture.asset(
//                         "images/lock.svg",
//                         width: 5,
//                         height: 5,fit: BoxFit.scaleDown,
//                       ), hintText: "Enter Password"),
//                   SizedBox(height: size.height*0.02,),
//                   TextFieldWidget(controller: confilmpasswordController,
//                       textInputAction: TextInputAction.done,
//                       focusNode: confirmPasswordFocusNode,
//                       errortext: confirmPasswordErrorvisible == true ? confirmPasswordError : '',
//                       onTap: (){
//                       setState(() {
//                       confirmPasswordErrorvisible=false;
//                       });
//                       },
//                       prefixIcon: SvgPicture.asset(
//                           "images/lock.svg",
//                           width: 5,
//                           height: 5,fit: BoxFit.scaleDown
//                       ), hintText: "Confirm Password"),
//                   SizedBox(height: size.height*0.05,),
//                   ButtonWidget(text: "SIGN UP", onPressed: (){
//                   validate();
//                   })
//
//
//                 ],
//               ),
//             ),
//           ],
//         )
//
//       ),
//     );
//   }
//   validate(){
//     if(passwordController.text.isEmpty){
//       setState(() {
//         passwordError="please enter password";
//         passwordErrorvisible=true;
//       });
//     }
//     else if(passwordController.text.length<8){
//       setState(() {
//         passwordError="Password must be 8 characters long";
//         passwordErrorvisible=true;
//       });
//     }
//     else if(RegExp(r"\s").hasMatch(passwordController.text)){
//       setState(() {
//         passwordError="please enter password";
//         passwordErrorvisible=true;
//       });
//     }
//     else if(confilmpasswordController.text.isEmpty){
//       setState(() {
//         confirmPasswordError="Password doesn't match";
//         confirmPasswordErrorvisible=true;
//       });
//     }
//     else if(RegExp(r"\s").hasMatch(confilmpasswordController.text)){
//       setState(() {
//         confirmPasswordError="Password doesn't match";
//         confirmPasswordErrorvisible=true;
//       });
//     }
//     else if(confilmpasswordController.text.length<8){
//       setState(() {
//         confirmPasswordError="Password doesn't match";
//         confirmPasswordErrorvisible=true;
//       });
//     }
//     else if(confilmpasswordController.text!=passwordController.text){
//       setState(() {
//         confirmPasswordError="Password doesn't match";
//         confirmPasswordErrorvisible=true;
//       });
//     }
//     else{
//       LoadingAlert(context: context);
//       emailPasswordProvider?.password=passwordController.text;
//       emailPasswordProvider?.SignUpFunction(context: context);
//     }
//
//   }
// }
