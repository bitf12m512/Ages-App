import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../Widgets/button_widget.dart';
import '../../Widgets/text_widget.dart';
import '../../Widgets/textfield_widget.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();



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
              SizedBox(height: size.height*0.02,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "images/back.svg",
                    height: size.height*0.05,
                  ),
                  TextWidget(
                    text: "EDIT PROFILE",
                    fontsize: 24,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                  Text("         "),


                ],
              ),
              SizedBox(height: size.height*0.02,),
              Stack(
                children: [
                  // image.isNotEmpty ? Container(
                  //   width: SizeConfig.screenWidth * 0.3,
                  //   height: SizeConfig.screenHeight * 0.1,
                  //   margin: const EdgeInsets.only(right: 12),
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(
                  //         image: NetworkImage(image.toString()),
                  //         fit: BoxFit.cover
                  //     ),
                  //     border: Border.all(color: AppColors.redColor),
                  //
                  //   ),
                  // ) :
                  InkWell(
                    onTap: (){
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(
                            MediaQuery.of(context).size.height * 0.1),
                        ),
                        gradient: const LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xffFFCB00), Color(0xffC96400)],
                        ),
                      ),
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.height * 0.11,
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
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top:  size.height*0.065,
                        left: size.width*0.19
                    ),
                    child: InkWell(
                      onTap: (){

                      },
                      child: CircleAvatar(
                        maxRadius: 12,
                        backgroundColor: Colors.white,
                        child: SvgPicture.asset(
                          "images/editicon.svg",
                          height: size.height*0.05,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height*0.02,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: "EDIT INFO",
                    fontsize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(height: size.height*0.01,),
                  TextFieldWidget(controller: nameController,
                      textInputAction: TextInputAction.next,
                      prefixIcon: SvgPicture.asset(
                        "images/profile.svg",
                        width: 5,
                        height: 5,fit: BoxFit.scaleDown,
                      ), hintText: "Sara Luva"),
                  SizedBox(height: size.height*0.02,),
                  TextFieldWidget(controller: emailController,
                      textInputAction: TextInputAction.next,
                      prefixIcon: SvgPicture.asset(
                        "images/mail.svg",
                        width: 5,
                        height: 5,fit: BoxFit.scaleDown,
                      ), hintText: "sara123@gmail.com"),

                ],
              ),
              SizedBox(height: size.height*0.04,),
              ButtonWidget(text: "SAVE CHANGES", onPressed: (){

              }),

            ],
          ),
        ),
      ),
    );
  }
}
