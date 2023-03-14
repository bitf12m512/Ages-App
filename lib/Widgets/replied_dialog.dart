import 'package:ages/Widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class showReplieddialog{
  static ShowLoadingDialog(context,String  name,String time,String ImgUrl,String msg,TextEditingController textEditingController,VoidCallback onTap){
    var size=MediaQuery.of(context).size;
    return showDialog(
      context: context,
      useRootNavigator: false,
      // routeSettings: RouteSettings(),
      builder: (BuildContext context) => WillPopScope(
        onWillPop: () async => true,
        child: AlertDialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          content: Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: size.height*0.01,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [

                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(
                                MediaQuery.of(context).size.height * 0.1),
                            ),
                            color: Colors.blue
                        ),
                        padding: const EdgeInsets.all(1),
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
                                imageUrl:ImgUrl==null?
                                "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg":ImgUrl,
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              )),
                        ),
                      ),
                      SizedBox(width: size.width*0.03,),
                      TextWidget(
                        text: name,
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      SizedBox(width: size.width*0.03,),
                      TextWidget(
                        text: time,
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffA1A1A1),
                      ),


                    ],
                  ),
                ),
                SizedBox(height: size.height*0.01,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: const Color(0xffFBF8EE),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                      msg,
                      style:GoogleFonts.poppins(
                        textStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 12
                        ),
                      )


                  ),
                ),
                SizedBox(height: size.height*0.01,),
                Container(
                  padding: const EdgeInsets.only(
                      left: 10,right: 10),
                  decoration:  BoxDecoration(
                      color: Color(0xffF7F7F7),
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
                          controller: textEditingController,
                          decoration:  InputDecoration(
                            hintText: "Replay Here",
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,horizontal: 5
                            ),
                            filled: true,
                            fillColor: const Color(0xffF7F7F7),
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
                      InkWell(
                        onTap: onTap,
                        child: SvgPicture.asset(
                          "images/send.svg",
                          height: size.height*0.03,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height*0.02,)
              ],
            ),
          ),

        ),
      ),
    );
  }
}