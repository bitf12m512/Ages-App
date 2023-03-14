import 'package:ages/HelperFunctions/firebase_methods.dart';
import 'package:ages/Screens/CommunityChat/chat_bubble.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../HelperFunctions/helper_functions.dart';
import '../../Providers/current_user_provider.dart';
import '../../Widgets/text_widget.dart';

class CommunityChatScreen extends StatefulWidget {
  const CommunityChatScreen({Key? key}) : super(key: key);

  @override
  _CommunityChatScreenState createState() => _CommunityChatScreenState();
}




class _CommunityChatScreenState extends State<CommunityChatScreen> {
  TextEditingController msgController=TextEditingController();
  FirebaseMethods? firebaseMethods;
  CurrentUserProvider? currentUserProvider;

  @override
  void initState() {
    firebaseMethods=Provider.of<FirebaseMethods>(context,listen: false);
    currentUserProvider=Provider.of<CurrentUserProvider>(context,listen: false);
    firebaseMethods?.getMessageList(senderid: FirebaseAuth.instance.currentUser!.uid);
    firebaseMethods?.getallUsers();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF6E091),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: size.width*0.04),
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
                    padding: const EdgeInsets.all(1),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.045,
                      width: MediaQuery.of(context).size.height * 0.045,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(
                              MediaQuery.of(context).size.height * 0.1))),
                      child: ClipRRect(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(1000)),
                          child:Consumer<CurrentUserProvider>(
                            builder: (cxt,dataprovider,child)=>
                                CachedNetworkImage(
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
                                  dataprovider.profileUrl==null? "https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg":dataprovider.profileUrl.toString(),
                                  fit: BoxFit.cover,
                                  alignment: Alignment.center,
                                ),
                          )),
                    ),
                  ),
                  TextWidget(
                    text: "Community Chat",
                    fontsize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  InkWell(
                    onTap: (){
                      HelperFunctions.moveToNextScreenWithPush(context, const CommunityChatScreen());
                    },
                    child: SvgPicture.asset(
                      "images/homeicon.svg",
                      height: size.height*0.04,
                    ),
                  ),

                ],
              ),
              Expanded(
                child: Consumer<FirebaseMethods>(
                  builder: (cxt,chatProvider,child)=>
                  ListView.builder(
                      shrinkWrap:  true,
                      reverse: true,
                      itemCount: chatProvider.cimmunityChatList.length,
                      itemBuilder: (BuildContext cxt,int index){
                      firebaseMethods?.userslist.where((element) => element.uid==firebaseMethods?.cimmunityChatList[index].uid);
                        var dt = getDateTimeByTimeStamp(int.parse(
                            chatProvider.cimmunityChatList[index]
                                .timestamp!.toString()), "hh:mm a");
                        String? dateTime;
                        if (index == chatProvider.cimmunityChatList.length - 1) {
                          dateTime = getDateTimeByTimeStamp(int.parse(
                              chatProvider.cimmunityChatList[chatProvider
                                  .cimmunityChatList.length - 1 - index]
                                  .timestamp!.toString()), "dd MMM yyyy");
                        }
                        else {
                          if (index > 0) {
                            var time = int.parse(
                                chatProvider.cimmunityChatList[chatProvider.cimmunityChatList.length - 1 - index].timestamp
                                    .toString());
                            var previous = DateTime
                                .fromMillisecondsSinceEpoch(time);
                            var time1 = int.parse(
                                chatProvider.cimmunityChatList[
                                  chatProvider.cimmunityChatList.length - 1 - index - 1]
                                    .timestamp.toString());
                            var next = DateTime.fromMillisecondsSinceEpoch(
                                time1);
                            if (previous.day - next.day != 0) {
                              dateTime = getDateTimeByTimeStamp(int.parse(
                                  chatProvider.cimmunityChatList[chatProvider.cimmunityChatList.length - 1 - index]
                                      .timestamp!.toString()), "dd MMM yyyy");
                            }
                          }
                          else {
                            if (index == 0 &&
                                chatProvider.cimmunityChatList.length > 1) {
                              var time = int.parse(
                                  chatProvider.cimmunityChatList[chatProvider.cimmunityChatList.length - 1 - index]
                                      .timestamp.toString());
                              var previous = DateTime
                                  .fromMillisecondsSinceEpoch(time);
                              var time1 = int.parse(
                                  chatProvider.cimmunityChatList[chatProvider.cimmunityChatList.length - 1 - index - 1]
                                      .timestamp.toString());
                              var next = DateTime.fromMillisecondsSinceEpoch(
                                  time1);
                              if (previous.day - next.day != 0) {
                                dateTime = getDateTimeByTimeStamp(int.parse(
                                    chatProvider.cimmunityChatList[chatProvider.cimmunityChatList.length - 1 - index]
                                        .timestamp!.toString()), "dd MMM yyyy");
                              }
                              else {
                                return ChatBubble(
                                    msgSenderId: chatProvider.cimmunityChatList[index].uid,
                                    authId: FirebaseAuth.instance.currentUser!.uid,
                                    msg: chatProvider.cimmunityChatList[index].msg,
                                    ImgUrl: currentUserProvider?.profileUrl.toString(),
                                    name: currentUserProvider?.name.toString(),
                                    keyvalue:chatProvider.cimmunityChatList[index].key,
                                    likes:chatProvider.cimmunityChatList[index].likes?['count'].toString(),
                                    index: index,isliked: chatProvider.cimmunityChatList[index].isliked!,
                                    datetime: dateTime,time: dt.toString(),
                                    atherusername:chatProvider.cimmunityChatList[index].userModel!.userName,
                                    atherImgUrl:chatProvider.cimmunityChatList[index].userModel!.profileUrl,
                                   replied: chatProvider.cimmunityChatList[index].replied,
                                  comment: chatProvider.cimmunityChatList[index].comment,
                                );

                              }
                            }
                            else {

                            }
                          }
                        }



                      return ChatBubble(
                          msgSenderId: chatProvider.cimmunityChatList[index].uid,
                          authId: FirebaseAuth.instance.currentUser!.uid,
                          msg: chatProvider.cimmunityChatList[index].msg,
                          ImgUrl: currentUserProvider?.profileUrl.toString(),
                          name: currentUserProvider?.name.toString(),
                          keyvalue:chatProvider.cimmunityChatList[index].key,
                          likes:chatProvider.cimmunityChatList[index].likes?['count'].toString(),
                          index: index,isliked: chatProvider.cimmunityChatList[index].isliked!,
                          datetime: dateTime,time: dt.toString(),
                          atherusername:chatProvider.cimmunityChatList[index].userModel!.userName,
                          atherImgUrl:chatProvider.cimmunityChatList[index].userModel!.profileUrl,
                          replied: chatProvider.cimmunityChatList[index].replied,
                          comment: chatProvider.cimmunityChatList[index].comment,
                          );
                  }),
                ),

              ),
              Padding(
                padding:  EdgeInsets.symmetric(vertical: 5),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 10,right: 10),
                  decoration:  BoxDecoration(
                      color: Colors.white,
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
                      InkWell(
                        onTap: () async{
                          if(msgController.text.isEmpty){

                          }
                          else if(msgController.text.trim().isEmpty){

                          }
                          else{
                            String msg=msgController.text;
                            msgController.clear();
                            await firebaseMethods?.sendMessagedata(msg: msg,
                                replayed: false,);
                          }

                        },
                        child: SvgPicture.asset(
                          "images/send.svg",
                          height: size.height*0.03,
                        ),
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
  String getDateTimeByTimeStamp(int? timestamp, String format) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp!);
    final DateFormat formatter = DateFormat(format);
    String formatted = formatter.format(date);
    return formatted;
  }



}
