import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../HelperFunctions/helper_functions.dart';
import '../../Providers/current_user_provider.dart';
import '../../Widgets/drawer_Widget.dart';
import '../../Widgets/text_widget.dart';
import '../CommunityChat/community_chat_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool ukbool=false;
  bool Portuguesbool =false;
  bool Spanishbool =false;
  bool francebool=false;
  bool usbool=false;
  bool Polskibool=false;
  bool netherlandsbool=false;
  bool Turkishbool=false;

  final List<String> imgList = [
    "images/book.png",
    "images/book.png",
  ];
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
    return Scaffold(
      backgroundColor: const Color(0xffF6E091),
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      bottomNavigationBar: Container(
        color:  Colors.white,
        padding: const EdgeInsets.all(10),
        child: SvgPicture.asset(
          "images/eu-project.svg",
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: Column(
              children: [
                SizedBox(height: size.height*0.02,),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
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
                      ),
                      Image.asset(
                        "images/ageslogo.png",
                        height: size.height*0.06,
                      ),
                      InkWell(
                        onTap: (){
                          HelperFunctions.moveToNextScreenWithPush(context, const CommunityChatScreen());
                        },
                        child: SvgPicture.asset(
                          "images/communitychat.svg",
                          height: size.height*0.05,
                        ),
                      ),

                    ],
                  ),

                SizedBox(height: size.height*0.02,),
                TextWidget(
                  text: "BOOKS TO READ",
                  fontsize: 24,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: size.height*0.02,),
                CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 0.6,
                      height:MediaQuery.of(context).size.height / 2.6,
                      autoPlay: false,
                      enableInfiniteScroll:false,
                      enlargeFactor: 0.3,
                      enlargeCenterPage: true,
                      onPageChanged: (index, reason){
                        print("Page No : ${index}");
                        print("Page No : ${reason.name}");
                      }
                  ),
                  items: imgList
                      .map((item) => ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(item,)))
                      .toList(),
                ),
                SizedBox(height: size.height*0.04,),
                TextWidget(
                  text: "CHOOSE LANGUAGE",
                  fontsize: 24,
                  fontWeight: FontWeight.normal,
                ),
                SizedBox(height: size.height*0.02,),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: size.width*0.07),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Languagebtn(text: "ENGLISH", imagename: "uk.svg",value: ukbool,
                            onTap: (){
                              setState(() {
                                ukbool=true;
                                Portuguesbool=false;
                                Spanishbool=false;
                                francebool=false;
                                usbool=false;
                                Polskibool=false;
                                netherlandsbool=false;
                                Turkishbool=false;
                              });
                            },
                          ),
                          Languagebtn(text: "PORTUGUES", imagename: "Portugues.svg",value: Portuguesbool,
                            onTap: (){
                              setState(() {
                                ukbool=false;
                                Portuguesbool=true;
                                Spanishbool=false;
                                francebool=false;
                                usbool=false;
                                Polskibool=false;
                                netherlandsbool=false;
                                Turkishbool=false;
                              });
                            },
                          ),
                          Languagebtn(text: "SPANISH", imagename: "spanish.svg",value:Spanishbool,
                            onTap: (){
                              setState(() {
                                ukbool=false;
                                Portuguesbool=false;
                                Spanishbool=true;
                                francebool=false;
                                usbool=false;
                                Polskibool=false;
                                netherlandsbool=false;
                                Turkishbool=false;
                              });
                            },
                          ),
                          Languagebtn(text: "FRENCH", imagename: "france.svg",value: francebool,
                            onTap: (){
                              setState(() {
                                ukbool=false;
                                Portuguesbool=false;
                                Spanishbool=false;
                                francebool=true;
                                usbool=false;
                                Polskibool=false;
                                netherlandsbool=false;
                                Turkishbool=false;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: size.height*0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Languagebtn(text: "POLSKI", imagename: "poland.svg",value: Polskibool,
                            onTap: (){
                              setState(() {
                                ukbool=false;
                                Portuguesbool=false;
                                Spanishbool=false;
                                francebool=false;
                                usbool=false;
                                Polskibool=true;
                                netherlandsbool=false;
                                Turkishbool=false;
                              });
                            },
                          ),
                          Languagebtn(text: "NEDERLAND", imagename: "netherlands.svg",value:netherlandsbool,
                            onTap: (){
                              setState(() {
                                ukbool=false;
                                Portuguesbool=false;
                                Spanishbool=false;
                                francebool=false;
                                usbool=false;
                                Polskibool=false;
                                netherlandsbool=true;
                                Turkishbool=false;
                              });
                            },
                          ),
                          Languagebtn(text: "TURKISH", imagename: "turkey.svg",value: Turkishbool,
                            onTap: (){
                              setState(() {
                                ukbool=false;
                                Portuguesbool=false;
                                Spanishbool=false;
                                francebool=false;
                                usbool=false;
                                netherlandsbool=false;
                                Turkishbool=true;
                                Polskibool=false;
                              });
                            },
                          ),
                          Text("   "),
                          Text("  "),



                        ],
                      )
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ),

    );
  }
}

class Languagebtn extends StatelessWidget {
  String text;
  String imagename;
  VoidCallback onTap;
  bool value;
  Languagebtn({required this.text,required this.imagename,required this.onTap,required this.value});

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            decoration:value==true?BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.5,1.4],
                colors: [Color(0xffFFCB00), Color(0xffC96400)],
              ),
              borderRadius: BorderRadius.circular(10),
            ):BoxDecoration(color: const Color(0xffFBFBFB),borderRadius: BorderRadius.circular(10),),
            padding: EdgeInsets.symmetric(
              vertical: size.height*0.017,
              horizontal: size.width*0.026
            ),
            child: SvgPicture.asset(
              "images/"+imagename,
              height: size.height*0.027,
            ),
          ),
        ),
        SizedBox(height: size.height*0.005,),
        Text(text,
          style: GoogleFonts.bebasNeue(
              textStyle: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                  letterSpacing: 0.5
              )
          ),
        )
      ],
    );
  }
}



