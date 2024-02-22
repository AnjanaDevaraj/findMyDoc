import 'package:flutter/material.dart';

import '../Utilities/appColors.dart';
import '../utilities/appStringConstants.dart';

class AddDoctor extends StatelessWidget {
  AddDoctor({super.key});

  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final specialisationController =
      TextEditingController(text: 'General medicine');
  final descriptionController = TextEditingController();
  final numberController = TextEditingController();
  final experienceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.themeColor,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Center(
                child: Text(
                  "Add Doctor",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                  ),
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///first name
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "First Name",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: firstnameController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),

                      ///last name
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Last Name",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: lastnameController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),

                      ///specialisation
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Specialisation",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        // height: 40,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                          items: AppStringConstants.specialities
                              .map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle dropdown value change here
                            specialisationController.text = newValue!;
                          },
                          value: specialisationController.text,
                        ),
                      ),

                      ///phone number
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Phone number",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: lastnameController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),

                      ///years of experience
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Years of experience",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: lastnameController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),

                      ///description
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          maxLines: 5,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: lastnameController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(height: 34,),
                      Center(
                        child: MaterialButton(
                            height: 45,
                            minWidth: 200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            color: AppColors.themeColor,
                            child: Text(
                              "Add Doctor",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            onPressed: () {
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder: (context) => DocResult()));
                            }),
                      ),
                      SizedBox(height: 20,)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
