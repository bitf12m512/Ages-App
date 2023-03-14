import 'package:ages/HelperFunctions/helper_functions.dart';
import 'package:ages/Providers/current_user_provider.dart';
import 'package:ages/Screens/CommunityChat/community_chat_screen.dart';
import 'package:ages/Screens/EditProfileScreen/edit_profile.dart';
import 'package:ages/Widgets/text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../Screens/AuthScreens/SignInScreen/signin_screen.dart';
import '../Screens/PrivacyPolicyScreen/privacy_policy_screen.dart';
import '../Screens/TermsAndCOnditionsScreen/terms_and_conditions.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  CurrentUserProvider? currentUserProvider;
  @override
  void initState() {
    currentUserProvider=Provider.of<CurrentUserProvider>(context,listen: false);
    currentUserProvider?.getCurrentUserData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50)
      ),
      child: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.2,0.9],
              colors: [Color(0xffFFCB00), Color(0xffCE6A05)],
            ),

          ),
          child: Column(
            children: [
              SizedBox(height: size.height*0.15,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.07),
                child: Consumer<CurrentUserProvider>(
                  builder: (cxt,dataprovider,child)=> Row(
                    children: [
                      Stack(
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
                              height: MediaQuery.of(context).size.height * 0.065,
                              width: MediaQuery.of(context).size.height * 0.065,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(
                                      MediaQuery.of(context).size.height * 0.1))),
                              child: ClipRRect(
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(1000)),
                                  child:
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
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top:  size.height*0.045,
                                left: size.width*0.037
                            ),
                            child: InkWell(
                              onTap: (){
                               HelperFunctions.moveToNextScreenWithPush(context, EditProfileScreen());
                              },
                              child: CircleAvatar(
                                maxRadius: 12,
                                backgroundColor: Colors.white,
                                child: SvgPicture.asset(
                                  "images/edit.svg",
                                  height: size.height*0.05,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(width: size.width*0.03,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: dataprovider.name==null?"test": dataprovider.name.toString(),
                            fontsize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                          TextWidget(
                            text: dataprovider.email.toString(),
                            fontsize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.white,

                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height*0.02,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width*0.04),
                child: Column(
                  children: [
                    ListTile(
                      leading:SvgPicture.asset(
                        "images/home.svg",
                        height: size.height*0.03,
                      ),
                      title: TextWidget(
                        text: "HOME",
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      trailing:SvgPicture.asset(
                        "images/backicon.svg",
                        height: size.height*0.02,
                      ),
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
                      leading:SvgPicture.asset(
                        "images/chat.svg",
                        height: size.height*0.03,
                      ),
                      title: TextWidget(
                        text: "COMMUNITY CHAT",
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      trailing:SvgPicture.asset(
                        "images/backicon.svg",
                        height: size.height*0.02,
                      ),
                      onTap: (){
                        HelperFunctions.moveToNextScreenWithPush(context, const CommunityChatScreen());
                      },
                    ),
                    ListTile(
                      leading:SvgPicture.asset(
                        "images/document.svg",
                        height: size.height*0.03,
                      ),
                      title: TextWidget(
                        text: "TERMS & CONDITIONS",
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      trailing:SvgPicture.asset(
                        "images/backicon.svg",
                        height: size.height*0.02,
                      ),
                      onTap: (){
                        HelperFunctions.moveToNextScreenWithPush(context, const TermsAndConditions());
                      },
                    ),
                    ListTile(
                      dense: true,
                      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),

                      leading:SvgPicture.asset(
                        "images/discovery.svg",
                        height: size.height*0.03,
                      ),
                      title: TextWidget(
                        text: "PRIVACY POLICY",
                        fontsize: 16,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                      trailing:SvgPicture.asset(
                        "images/backicon.svg",
                        height: size.height*0.02,
                      ),
                      onTap: (){
                        HelperFunctions.moveToNextScreenWithPush(context, const PrivacyPolicy());
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width*0.09,vertical: size.height*0.02),
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            "images/logout.svg",
                            height: size.height*0.035,
                          ),
                          SizedBox(width: size.width*0.04,),
                          InkWell(
                            onTap: () async {
                              await FirebaseAuth.instance.signOut();
                              HelperFunctions.moveToNextScreen(context, const SignInScreen());
                            },
                            child: TextWidget(
                              text: "LOGOUT",
                              fontsize: 16,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      )
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