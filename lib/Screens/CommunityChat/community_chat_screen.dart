import 'package:ages/Screens/HomeScreen/home_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../HelperFunctions/helper_functions.dart';
import '../../Widgets/text_widget.dart';

class CommunityChatScreen extends StatefulWidget {
  const CommunityChatScreen({Key? key}) : super(key: key);

  @override
  _CommunityChatScreenState createState() => _CommunityChatScreenState();
}

class _CommunityChatScreenState extends State<CommunityChatScreen> {
  TextEditingController msgController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.04),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  children: [
                    SizedBox(height: size.height*0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                MediaQuery.of(context).size.height * 0.1),
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff0065F7), Color(0xff06C406)],
                            ),
                          ),
                          padding: EdgeInsets.all(1),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.045,
                            width: MediaQuery.of(context).size.height * 0.045,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    MediaQuery.of(context).size.height * 0.1))),
                            child: ClipRRect(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(1000)),
                                child:CachedNetworkImage(
                                  placeholder: (context, url) => Center(
                                    child: Container(
                                      child: const CircularProgressIndicator(),
                                      padding: const EdgeInsets.all(80.0),
                                      decoration: const BoxDecoration(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Material(
                                        child: Image.network(
                                          "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",
                                          fit: BoxFit.fill,
                                        ),
                                        clipBehavior: Clip.hardEdge,
                                      ),
                                  imageUrl:
                                  "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                )),
                          ),
                        ),
                        TextWidget(
                          text: "COMMUNITY CHAT",
                          fontsize: 24,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                        InkWell(
                          onTap: (){
                            HelperFunctions.moveToNextScreenWithPush(context, const HomeScreen());
                          },
                          child: SvgPicture.asset(
                            "images/homeicon.svg",
                            height: size.height*0.05,
                          ),
                        ),

                      ],
                    ),
                    SizedBox(height: size.height*0.04,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    MediaQuery.of(context).size.height * 0.1),
                                ),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xff0065F7), Color(0xff06C406)],
                                ),
                              ),
                              padding: EdgeInsets.all(1),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.035,
                                width: MediaQuery.of(context).size.height * 0.035,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        MediaQuery.of(context).size.height * 0.1))),
                                child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(1000)),
                                    child:CachedNetworkImage(
                                      placeholder: (context, url) => Center(
                                        child: Container(
                                          child: const CircularProgressIndicator(),
                                          padding: const EdgeInsets.all(80.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Material(
                                            child: Image.network(
                                              "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",
                                              fit: BoxFit.fill,
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                          ),
                                      imageUrl:
                                      "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    )),
                              ),
                            ),
                            SizedBox(width: size.width*0.03,),
                            TextWidget(
                              text: "Sara Luva",
                              fontsize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(width: size.width*0.03,),
                            TextWidget(
                              text: "9:10 am",
                              fontsize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffA1A1A1),
                            ),

                          ],
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                /*constraints: BoxConstraints(
                              maxWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.80,
                            ),*/

                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    left: 35
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF0F0F0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
                                    style:GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    )


                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    bottom: 5,
                                    left: 35
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width*0.1,
                                            vertical: size.height*0.008
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "images/heart.svg",
                                              width: 20,
                                              height: 20,fit: BoxFit.scaleDown,
                                            ),
                                            TextWidget(
                                              text: "LIKES (02)",
                                              fontsize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: size.width*0.01,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width*0.1,
                                            vertical: size.height*0.008
                                        ),

                                        decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "images/replay.svg",
                                              width: 20,
                                              height: 20,fit: BoxFit.scaleDown,
                                            ),
                                            TextWidget(
                                              text: "REPLY    ",
                                              fontsize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [

                            TextWidget(
                              text: "Sara Luva",
                              fontsize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),

                            SizedBox(width: size.width*0.03,),
                            TextWidget(
                              text: "9:10 am",
                              fontsize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffA1A1A1),
                            ),

                            SizedBox(width: size.width*0.03,),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    MediaQuery.of(context).size.height * 0.1),
                                ),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xff0065F7), Color(0xff06C406)],
                                ),
                              ),
                              padding: EdgeInsets.all(1),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.035,
                                width: MediaQuery.of(context).size.height * 0.035,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        MediaQuery.of(context).size.height * 0.1))),
                                child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(1000)),
                                    child:CachedNetworkImage(
                                      placeholder: (context, url) => Center(
                                        child: Container(
                                          child: const CircularProgressIndicator(),
                                          padding: const EdgeInsets.all(80.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Material(
                                            child: Image.network(
                                              "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",
                                              fit: BoxFit.fill,
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                          ),
                                      imageUrl:
                                      "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    )),
                              ),
                            ),


                          ],
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                /*constraints: BoxConstraints(
                              maxWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.80,
                            ),*/

                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    right: 35
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffFAF0E5),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                    "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
                                    style:GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 12
                                      ),
                                    )


                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(

                                    bottom: 5,
                                    right: 35
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width*0.1,
                                            vertical: size.height*0.008
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffFAF0E5),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "images/heart.svg",
                                              width: 20,
                                              height: 20,fit: BoxFit.scaleDown,
                                            ),
                                            TextWidget(
                                              text: "LIKES (02)",
                                              fontsize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: size.width*0.01,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width*0.1,
                                            vertical: size.height*0.008
                                        ),

                                        decoration: BoxDecoration(
                                          color: const Color(0xffFAF0E5),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "images/replay.svg",
                                              width: 20,
                                              height: 20,fit: BoxFit.scaleDown,
                                            ),
                                            TextWidget(
                                              text: "REPLY   ",
                                              fontsize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height*0.02,),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    MediaQuery.of(context).size.height * 0.1),
                                ),
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [Color(0xff0065F7), Color(0xff06C406)],
                                ),
                              ),
                              padding: EdgeInsets.all(1),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.035,
                                width: MediaQuery.of(context).size.height * 0.035,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(
                                        MediaQuery.of(context).size.height * 0.1))),
                                child: ClipRRect(
                                    borderRadius:
                                    const BorderRadius.all(Radius.circular(1000)),
                                    child:CachedNetworkImage(
                                      placeholder: (context, url) => Center(
                                        child: Container(
                                          child: const CircularProgressIndicator(),
                                          padding: const EdgeInsets.all(80.0),
                                          decoration: const BoxDecoration(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Material(
                                            child: Image.network(
                                              "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",
                                              fit: BoxFit.fill,
                                            ),
                                            clipBehavior: Clip.hardEdge,
                                          ),
                                      imageUrl:
                                      "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg",
                                      fit: BoxFit.cover,
                                      alignment: Alignment.center,
                                    )),
                              ),
                            ),
                            SizedBox(width: size.width*0.03,),
                            TextWidget(
                              text: "Sara Luva",
                              fontsize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            SizedBox(width: size.width*0.03,),
                            TextWidget(
                              text: "9:10 am",
                              fontsize: 16,
                              fontWeight: FontWeight.normal,
                              color: Color(0xffA1A1A1),
                            ),

                          ],
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                width: double.infinity,
                                /*constraints: BoxConstraints(
                              maxWidth: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.80,
                            ),*/

                                padding: const EdgeInsets.all(5),
                                margin: const EdgeInsets.only(
                                    top: 5,
                                    bottom: 5,
                                    left: 35
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xffF0F0F0),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    Container(

                                      width: double.infinity,

                                      decoration: BoxDecoration(
                                          color: const Color(0xffFBF8EE),
                                          borderRadius: BorderRadius.circular(5)
                                      ),
                                      child: IntrinsicHeight(

                                        child: Row(
                                          children: [
                                            Container(
                                              decoration: const BoxDecoration(
                                                color: Color(0xffCE6A05),
                                                borderRadius: BorderRadius.only(
                                                  bottomLeft: Radius.circular(
                                                    8.0,
                                                  ),
                                                  topLeft: Radius.circular(
                                                    8.0,
                                                  ),
                                                ),
                                              ),
                                              width: 7.0,
                                            ),
                                            SizedBox(width: size.width*0.02,),
                                            Expanded(
                                              child: Padding(
                                                padding:  EdgeInsets.symmetric(vertical: 5),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    TextWidget(
                                                      text: "Jacob Man",
                                                      fontsize: 12,
                                                      fontWeight: FontWeight.normal,
                                                      color: Color(0xffCE6A05),
                                                    ),
                                                    Text(
                                                        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
                                                        style:GoogleFonts.poppins(
                                                          textStyle: const TextStyle(
                                                              color: Colors.black,
                                                              fontSize: 10
                                                          ),
                                                        )
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    Text(
                                        "In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
                                        style:GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(

                                    bottom: 5,
                                    left: 35
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width*0.1,
                                            vertical: size.height*0.008
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "images/heart.svg",
                                              width: 20,
                                              height: 20,fit: BoxFit.scaleDown,
                                            ),
                                            TextWidget(
                                              text: "LIKES (02)",
                                              fontsize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: size.width*0.01,),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: size.width*0.1,
                                            vertical: size.height*0.008
                                        ),

                                        decoration: BoxDecoration(
                                          color: const Color(0xffF0F0F0),
                                          borderRadius: BorderRadius.circular(5),
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              "images/replay.svg",
                                              width: 20,
                                              height: 20,fit: BoxFit.scaleDown,
                                            ),
                                            TextWidget(
                                              text: "REPLY    ",
                                              fontsize: 14,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black,
                                            ),

                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
              ),

              Padding(
                padding:  EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10,right: 10),
                  decoration:  BoxDecoration(
                      color: const Color(0xffe0e0e0),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  width: double.infinity,
                  child: Row(
                    children: <Widget>[
                      SvgPicture.asset(
                        "images/emoji.svg",
                        height: size.height*0.03,
                      ),
                      const SizedBox(width: 15,),
                      Expanded(
                        child: TextField(
                          controller: msgController,
                          decoration:  InputDecoration(
                            hintText: "Message Here",
                            hintStyle: GoogleFonts.poppins(
                              textStyle:  const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black
                              )
                            ),
                            border: InputBorder.none,

                          ),
                          onChanged: (value) async {


                          },
                        ),
                      ),
                      const SizedBox(width: 15,),
                      SvgPicture.asset(
                        "images/send.svg",
                        height: size.height*0.03,
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
