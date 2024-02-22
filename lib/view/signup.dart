import 'package:findmydoc/view/login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utilities/appColors.dart';
import '../Utilities/firebase_auth_Functions.dart';
import '../utilities/appAssets.dart';
import 'home.dart';

class Signup extends StatefulWidget {
  Signup({super.key});


  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppAssets.appLogo,
              height: 50,
              width: 50,
            ),
            SizedBox(height: 8,),
            Text(
              "Welcome!",
              style: GoogleFonts.inter(
                  color: AppColors.themeColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Create your account",
              style: TextStyle(color: AppColors.themeColor, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.themeColor),
                    hintText: "Name",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.themeColor),
                    hintText: "Email",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.themeColor),
                    hintText: "Password",
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            MaterialButton(
              height: 45,
                onPressed: () {
                  // FirebaseFunctions()
                  //     .registerUser(
                  //     email: emailController.text.trim(),
                  //     pwd: passwordController.text.trim())
                  //     .then((response) {
                  //   if (response == null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage(name: nameController.text)));
                  //   } else {
                  //     ScaffoldMessenger.of(context)
                  //         .showSnackBar(SnackBar(content: Text(response)));
                  //   }
                  // }
                  // );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: AppColors.themeColor,
                child: Text(
                  'Signup',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: RichText(
                  text: TextSpan(text: 'Already a user?', style: TextStyle(color: AppColors.themeColor), children: [
                    TextSpan(
                        text: "Login",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ))
                  ]),
                ))
          ],
        ),
      ),

    );
  }
}
