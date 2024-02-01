import 'package:findmydoc/Utilities/appColors.dart';
import 'package:findmydoc/view/home.dart';
import 'package:findmydoc/view/signup.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Utilities/firebase_auth_Functions.dart';
import '../utilities/appAssets.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
              "Login to your account",
              style: TextStyle(color: AppColors.themeColor, fontSize: 16),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Forgot password?",
                style: TextStyle(color: AppColors.themeColor),
                textAlign: TextAlign.right,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            MaterialButton(
                onPressed: () {
                  FirebaseFunctions()
                      .loginUser(
                          email: emailController.text.trim(),
                          pwd: passwordController.text.trim())
                      .then((response) {
                    if (response == null) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    } else {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(response)));
                    }
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
                color: AppColors.themeColor,
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: RichText(
                  text: TextSpan(text: 'Not a user?', style: TextStyle(color: AppColors.themeColor), children: [
                    TextSpan(
                        text: "Signup",
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
