
import 'package:ages/Widgets/replied_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../HelperFunctions/firebase_methods.dart';
import '../../Widgets/text_widget.dart';

class ChatBubble extends StatefulWidget {
  String? msgSenderId;
  String authId;
  String? msg;
  String? ImgUrl;
  String? name;
  String? likes;
  String? keyvalue;
  int? index;
  bool? isliked;
  String? datetime;
  String time;
  String? atherusername;
  String? atherImgUrl;
  bool? replied;
  String? comment;

  ChatBubble({required this.msgSenderId,
    required this.authId,required this.msg,required this.ImgUrl,
    required this.name,required this.likes,required this.keyvalue,
    this.index,required this.isliked,required this.datetime,required this.time,
    this.atherusername, this.atherImgUrl, this.replied,this.comment
  });

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  FirebaseMethods? firebaseMethods;
  TextEditingController commentcontroller= TextEditingController();
  @override
  void initState() {
    firebaseMethods=Provider.of<FirebaseMethods>(context,listen: false);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    if( widget.msgSenderId==widget.authId){
      return Column(
        children: [
          widget.datetime != null ? Center(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 7),
              margin: const EdgeInsets.symmetric(
                  vertical: 10),
              child: Text(
                  widget.datetime.toString(), style: GoogleFonts.bebasNeue(
                textStyle: const TextStyle(
                    color: Color(0xffA1A1A1),
                    fontSize: 14
                ),
              )
              ),
            ),
          ) : Container(),
          widget.replied==true?
              Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  TextWidget(
                    text: "You",
                    fontsize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),

                  SizedBox(width: size.width*0.03,),
                  TextWidget(
                    text: widget.time,
                    fontsize: 16,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xffA1A1A1),
                  ),

                  SizedBox(width: size.width*0.03,),
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
                            imageUrl:widget.ImgUrl==null?
                            "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg":widget.ImgUrl.toString(),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          )),
                    ),
                  ),


                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                color: const Color(0xffF6E091),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                            text: "YOU",
                                            fontsize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xffCE6A05),
                                          ),
                                          Text(
                                              widget.msg.toString(),
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
                              widget.comment.toString(),
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

                  ],
                ),
              ),
            ],
          ):
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      TextWidget(
                        text: "You",
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),

                      SizedBox(width: size.width*0.03,),
                      TextWidget(
                        text: widget.time,
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffA1A1A1),
                      ),

                      SizedBox(width: size.width*0.03,),
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
                                imageUrl:widget.ImgUrl==null?
                                "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg":widget.ImgUrl.toString(),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              )),
                        ),
                      ),


                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    color: const Color(0xffF6E091),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(5),
                          margin: const EdgeInsets.only(
                              top: 5,
                              bottom: 5,
                              right: 35
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xffedc26e),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                              widget.msg.toString(),
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
                                child: InkWell(
                                  onTap:widget.isliked==true? null: (){
                                    firebaseMethods?.updateLikes(key: widget.keyvalue.toString(),
                                        senderid: FirebaseAuth.instance.currentUser!.uid);
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width*0.1,
                                        vertical: size.height*0.008
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xffedc26e),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Row(
                                      children: [
                                        widget.isliked==true?
                                        SvgPicture.asset(
                                          "images/heart.svg",
                                          width: 20,
                                          height: 20,fit: BoxFit.scaleDown,
                                        ):const Icon(Icons.favorite_border,size: 20,),

                                        TextWidget(
                                          text: "LIKES (${widget.likes})",
                                          fontsize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width*0.01,),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    showReplieddialog.ShowLoadingDialog(context,
                                        widget.name.toString(), widget.time,
                                        widget.ImgUrl.toString(), widget.msg.toString(), commentcontroller,
                                            () async {
                                          if(commentcontroller.text.isEmpty){

                                          }
                                          else if(commentcontroller.text.trim().isEmpty){

                                          }
                                          else{
                                            String msg=commentcontroller.text;
                                            commentcontroller.clear();
                                            await firebaseMethods?.sendcommentdata(msg: widget.msg.toString(),
                                              replayed: true, comment: msg,);
                                              Navigator.pop(context);
                                          }
                                        });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: size.width*0.1,
                                        vertical: size.height*0.008
                                    ),

                                    decoration: BoxDecoration(
                                      color: const Color(0xffedc26e),
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
      );
    }
    else{
      return  Column(
        children: [
          widget.datetime != null ? Center(
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 7),
              margin: const EdgeInsets.symmetric(
                  vertical: 10),
              child: Text(
                  widget.datetime.toString(), style: GoogleFonts.bebasNeue(
                textStyle: const TextStyle(
                    color: Color(0xffA1A1A1),
                    fontSize: 14
                ),
              )
              ),
            ),
          ) : Container(),
          widget.replied==true?
              Column(
            children: [
              Row(
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
                            imageUrl: widget.atherImgUrl==null?
                            "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg":widget.atherImgUrl.toString(),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          )),
                    ),
                  ),
                  SizedBox(width: size.width*0.03,),
                  TextWidget(
                    text: widget.atherusername.toString(),
                    fontsize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  SizedBox(width: size.width*0.03,),
                  TextWidget(
                    text: widget.time,
                    fontsize: 16,
                    fontWeight: FontWeight.normal,
                    color: const Color(0xffA1A1A1),
                  ),

                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                color: const Color(0xffF6E091),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                            text: widget.atherusername.toString(),
                                            fontsize: 12,
                                            fontWeight: FontWeight.normal,
                                            color: Color(0xffCE6A05),
                                          ),
                                          Text(
                                              widget.msg.toString(),
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
                              widget.comment.toString(),
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

                  ],
                ),
              ),
            ],
          ):
              Column(
                children: [
                  Row(
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
                                imageUrl: widget.atherImgUrl==null?
                                "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg":widget.atherImgUrl.toString(),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              )),
                        ),
                      ),
                      SizedBox(width: size.width*0.03,),
                      TextWidget(
                        text: widget.atherusername.toString(),
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.black,
                      ),
                      SizedBox(width: size.width*0.03,),
                      TextWidget(
                        text: widget.time,
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xffA1A1A1),
                      ),

                    ],
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    color: const Color(0xffF6E091),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
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
                              widget.msg.toString(),
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
                                child: InkWell(
                                  onTap:widget.isliked==true? null:(){
                                    firebaseMethods?.updateLikes(key: widget.keyvalue.toString(),
                                        senderid: FirebaseAuth.instance.currentUser!.uid
                                    );
                                  },
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
                                        widget.isliked==true?
                                        SvgPicture.asset(
                                          "images/heart.svg",
                                          width: 20,
                                          height: 20,fit: BoxFit.scaleDown,
                                        ):const Icon(Icons.favorite_border,size: 20,),
                                        TextWidget(
                                          text: "LIKES (${widget.likes})",
                                          fontsize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black,
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width*0.01,),
                              Expanded(
                                child: InkWell(
                                  onTap: (){
                                    showReplieddialog.ShowLoadingDialog(context,
                                        widget.atherusername.toString(), widget.time,
                                        widget.atherImgUrl.toString(), widget.msg.toString(), commentcontroller, () {
                                          showReplieddialog.ShowLoadingDialog(context,
                                              widget.name.toString(), widget.time,
                                              widget.ImgUrl.toString(), widget.msg.toString(), commentcontroller,
                                                  () async {
                                                if(commentcontroller.text.isEmpty){

                                                }
                                                else if(commentcontroller.text.trim().isEmpty){

                                                }
                                                else{
                                                  String msg=commentcontroller.text;
                                                  commentcontroller.clear();
                                                  await firebaseMethods?.sendcommentdata(msg: widget.msg.toString(),
                                                    replayed: true, comment: msg,);
                                                  Navigator.pop(context);
                                                }
                                              });
                                        });
                                  },
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
      );

    }
  }
}
