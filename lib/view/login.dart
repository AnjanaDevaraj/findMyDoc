import 'package:findmydoc/Utilities/appColors.dart';
import 'package:findmydoc/view/home.dart';
import 'package:findmydoc/view/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../firebase_files/firebase_auth_Functions.dart';
import '../admin/admin_home.dart';
import '../utilities/appAssets.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var is_PwdHidden = true;

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  String adminEmail = 'admin@gmail.com';

  String adminpwd = '123456';

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
              color: AppColors.themeColor,
            ),
            SizedBox(
              height: 8,
            ),
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
              padding: EdgeInsets.all(12),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.themeColor),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(26),
                    )),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: TextField(
                obscureText: is_PwdHidden,
                obscuringCharacter: '*',
                controller: passwordController,
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: AppColors.themeColor),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          if (is_PwdHidden) {
                            is_PwdHidden = false;
                          } else {
                            is_PwdHidden = true;
                          }
                          ;
                        });
                      },
                      icon: Icon(
                        is_PwdHidden == true
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.themeColor,
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: AppColors.themeColor),
                      textAlign: TextAlign.right,
                    ),
                  ),
                )),
            SizedBox(
              height: 6,
            ),
            MaterialButton(
                height: 45,
                onPressed: () {
                  FirebaseFunctions()
                      .loginUser(
                          email: emailController.text.trim(),
                          pwd: passwordController.text.trim())
                      .then((response) {
                    if (response == null) {
                      if (emailController.text == adminEmail &&
                          passwordController.text == adminpwd) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => AdminHome()));
                      } else {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomePage()));
                      }
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
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black38,
                    ),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Text('or'),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.black38,
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () async{
                User? user = await FirebaseFunctions().handleSignIn();
                if (user != null) {
                  print('Signed in as ${user.displayName}');
                } else {
                  print('Sign-in failed');
                }
              },
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black12
                      ),
                      borderRadius: BorderRadius.circular(10),
                      //color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/icons/google.png",
                          height: 20,
                          width: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => Signup()));
                },
                child: RichText(
                  text: TextSpan(
                      text: 'Not a user?',
                      style: TextStyle(color: AppColors.themeColor),
                      children: [
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
