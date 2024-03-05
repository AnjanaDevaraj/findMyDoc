import 'dart:async';

import 'package:findmydoc/utilities/appAssets.dart';
import 'package:findmydoc/view/favourites.dart';
import 'package:findmydoc/view/history.dart';
import 'package:findmydoc/view/home.dart';
import 'package:findmydoc/view/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'view/login.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCiK-o3Qz55DXSmdqW6rPPdN0E2TNsYVPI",
          appId: "1:194874909498:android:efbbe4f2176e336d9ae603",
          messagingSenderId: "",
          projectId: "findmydoc-d7a5f",
          storageBucket: "findmydoc-d7a5f.appspot.com"));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:
      //user == null ?
      SplashHome(),
      //: HomePage(),
      routes: {
        '/home': (context) => HomePage(),
        '/favourites': (context) => Favourites(),
        '/history': (context) => History(),
        '/profile': (context) => ProfilePage(),
        '/login': (context) => Login(),
      },
    );
  }
}

class SplashHome extends StatefulWidget {
  const SplashHome({super.key});

  @override
  State<SplashHome> createState() => _SplashHomeState();
}

class _SplashHomeState extends State<SplashHome> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      // user == null
      //     ?
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
          // : Navigator.of(context)
          // .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    }
    );
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              AppAssets.animLogo,
              // height: 50,
              // width: 50,
            ),
            SizedBox(
              height: 5,
            ),
            // Text(
            //   "Find my Doctor",
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            // )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


