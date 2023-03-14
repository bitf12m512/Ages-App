
import 'package:ages/HelperFunctions/firebase_methods.dart';
import 'package:ages/Providers/current_user_provider.dart';
import 'package:ages/Screens/AuthScreens/SignInScreen/signin_screen.dart';
import 'package:ages/Providers/email_password_provider.dart';
import 'package:ages/Screens/AuthScreens/SignUpScreen/signup_screen.dart';
import 'package:ages/Screens/CommunityChat/community_chat_screen.dart';
import 'package:ages/Screens/EditProfileScreen/edit_profile.dart';
import 'package:ages/Screens/HomeScreen/home_screen.dart';
import 'package:ages/Widgets/drawer_Widget.dart';
import 'package:ages/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Providers/image_upload_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context)=>EmailPasswordProvider(),
        child: const SignUpScreen() ,
      ),

      ChangeNotifierProvider(
        create: (context)=>EmailPasswordProvider(),
        child: const SignInScreen(),
      ),
      ChangeNotifierProvider(
        create: (context)=>ImageUploadProvider(),
        child: const EditProfileScreen(),
      ),
      ChangeNotifierProvider(
        create: (context)=>CurrentUserProvider(),
        child: const EditProfileScreen(),
      ),
      ChangeNotifierProvider(
        create: (context)=>CurrentUserProvider(),
        child: const HomeScreen(),
      ),
      ChangeNotifierProvider(
        create: (context)=>CurrentUserProvider(),
        child: const DrawerWidget(),
      ),
      ChangeNotifierProvider(
        create: (context)=>FirebaseMethods(),
        child: const CommunityChatScreen(),
      ),
    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "times new roman",
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    ),
    );
  }
}


