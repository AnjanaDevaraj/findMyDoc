import 'package:findmydoc/Utilities/appColors.dart';
import 'package:findmydoc/view/home.dart';
import 'package:findmydoc/view/signup.dart';
import 'package:flutter/material.dart';

import '../Utilities/firebase_auth_Functions.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final email_controller = TextEditingController();
  final pw_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome!",
              style: TextStyle(
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
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: TextField(
                controller: email_controller,
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
                controller: pw_controller,
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
                          email: email_controller.text.trim(),
                          pwd: pw_controller.text.trim())
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
                shape: StadiumBorder(),
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
                  text: TextSpan(text: 'Not a user?', children: [
                    TextSpan(
                        text: "Signup",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ))
                  ]),
                ))
          ],
        ),
      ),
    );
  }
}
