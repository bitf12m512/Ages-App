import 'dart:io';
import 'package:ages/Providers/current_user_provider.dart';
import 'package:ages/Providers/image_upload_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
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
  File? _pickedImage;
  ImageUploadProvider? imageUploadProvider;
  CurrentUserProvider? currentUserProvider;
  final FirebaseAuth auth = FirebaseAuth.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref();


  @override
  void initState() {

    imageUploadProvider=Provider.of<ImageUploadProvider>(context,listen: false);
    currentUserProvider=Provider.of<CurrentUserProvider>(context,listen: false);
    currentUserProvider?.getCurrentUserData();
    setState(() {
      emailController.text=currentUserProvider!.email.toString();
      if(currentUserProvider!.name !=null){
        nameController.text=currentUserProvider!.name.toString();
      }

    });
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    currentUserProvider?.getCurrentUserData();
    // TODO: implement dispose
    super.dispose();
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
                  InkWell(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      "images/back.svg",
                      height: size.height*0.05,
                    ),
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(
                          MediaQuery.of(context).size.height * 0.1),
                      ),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomRight,
                        colors: [Color(0xffFFC803), Color(0xffC96400)],
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
                          child:_pickedImage==null?CachedNetworkImage(
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
                            currentUserProvider?.profileUrl==null?"https://cvbay.com/wp-content/uploads/2017/03/dummy-image.jpg":currentUserProvider!.profileUrl.toString(),
                            fit: BoxFit.cover,
                            alignment: Alignment.center,
                          ):Image.file(
                            _pickedImage as File,
                            fit: BoxFit.fill,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top:  size.height*0.065,
                        left: size.width*0.19
                    ),
                    child: InkWell(
                      onTap: (){
                       _pickedImagedialog();
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
                      textInputAction: TextInputAction.done,
                      prefixIcon: SvgPicture.asset(
                        "images/profile.svg",
                        width: 5,
                        height: 5,fit: BoxFit.scaleDown,
                      ), hintText: "Sara Luva"),
                  SizedBox(height: size.height*0.02,),
                  TextFieldWidget(
                      controller: emailController,
                      textInputAction: TextInputAction.done,
                      readonly: true,
                      prefixIcon: SvgPicture.asset(
                        "images/mail.svg",
                        width: 5,
                        height: 5,
                        fit: BoxFit.scaleDown,
                      ), hintText: "sara123@gmail.com"),
                ],
              ),
              SizedBox(height: size.height*0.04,),
              ButtonWidget(text: "SAVE CHANGES", onPressed: (){
                validate();
              }),

            ],
          ),
        ),
      ),
    );
  }
  void _pickedImagedialog() {
    showDialog<ImageSource>(
      context: context,
      builder: (context) => AlertDialog(
          content: TextWidget(text: "CHOOSE IMAGE SOURCE",fontWeight: FontWeight.normal,),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          actions: [
            MaterialButton(
              child: TextWidget(text: "CAMERA",fontWeight: FontWeight.normal),
              onPressed: () => Navigator.pop(context, ImageSource.camera),
            ),
            MaterialButton(
              child: TextWidget(text: "GALLERY",fontWeight: FontWeight.normal),
              onPressed: () => Navigator.pop(context, ImageSource.gallery),
            ),
          ]
      ),
    ).then((ImageSource? source) async {
      if (source != null) {
        final pickedFile = await ImagePicker().getImage(source: source);
        setState(() => _pickedImage = File(pickedFile!.path));
      }
    });
  }
  validate() async {
    if(_pickedImage==null){
      if(nameController.text.isEmpty){
        print("PLZ enter name ot profile to update");
      }
      else{
        ref.child("users").child(auth.currentUser!.uid).update({
          "userName":nameController.text,
        });
        const snackBar = SnackBar(
          content: Text('Name Updated'),
        );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

      }
    }
    else if(_pickedImage!=null && nameController.text.isEmpty){
      imageUploadProvider?.request(context: context, file: _pickedImage!.path);
      const snackBar = SnackBar(
        content: Text('Image updated'),
      );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    else  {
     imageUploadProvider?.request(context: context, file: _pickedImage!.path);
     await ref.child("users").child(auth.currentUser!.uid).update({
       "userName":nameController.text,
     });
     const snackBar = SnackBar(
       content: Text('Profile Updated'),
     );

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);

    }

  }

}
