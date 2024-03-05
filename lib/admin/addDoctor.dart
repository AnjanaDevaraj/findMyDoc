import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../Utilities/appColors.dart';
import '../firebase_files/firebase_crud.dart';
import '../utilities/appStringConstants.dart';
import 'admin_home.dart';
import 'package:path/path.dart' as path;

class AddDoctor extends StatefulWidget {
  AddDoctor({super.key});

  @override
  State<AddDoctor> createState() => _AddDoctorState();
}

class _AddDoctorState extends State<AddDoctor> {
  FirebaseStorage storage = FirebaseStorage.instance;

  final docnameController = TextEditingController();
  final specialisationController =
      TextEditingController(text: 'General medicine');
  final locationController = TextEditingController(text: 'Aluva');
  final descriptionController = TextEditingController();
  final address1Controller = TextEditingController();
  final address2Controller = TextEditingController();
  final mapLinkController = TextEditingController();
  final phoneController = TextEditingController();
  final experienceController = TextEditingController();

  XFile? pickedImg;

  @override
  void initState() {
    _userCollection = FirebaseFirestore.instance.collection('docData');
    super.initState();
  }

  late CollectionReference _userCollection;

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
                      ///doctor's name
                      SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Doctor's Name",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: docnameController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),

                      ///add photo
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () {
                          //_pickImage(ImageSource.gallery);
                          // Navigator.pop(context);
                          Upload();
                        },
                        child: pickedImg != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.file(
                                  File(pickedImg!.path),
                                  height: 200,
                                  width: 200,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : Container(
                                height: 200,
                                width: 200,
                                margin: EdgeInsets.symmetric(vertical: 8),
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 1,
                                  ),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_circle_outline_outlined),
                                    Text(
                                      'Add photo',
                                      style: TextStyle(
                                        color: Colors.grey.shade800,
                                      ),
                                    ),
                                  ],
                                ),
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
                          controller: phoneController,
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
                          controller: experienceController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),

                      ///address 1
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Address Line 1",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          maxLines: 4,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: address1Controller,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),

                      ///address 2
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Address Line 2",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 150,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          maxLines: 4,
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: address2Controller,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),

                      ///location
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Location",
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
                          items: AppStringConstants.cities.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            // Handle dropdown value change here
                            locationController.text = newValue!;
                          },
                          value: locationController.text,
                        ),
                      ),

                      ///mapLink
                      SizedBox(
                        height: 26,
                      ),
                      Text(
                        "Map link",
                        style: TextStyle(fontSize: 16),
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.symmetric(vertical: 6),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          textAlign: TextAlign.left,
                          controller: mapLinkController,
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
                          controller: descriptionController,
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: 34,
                      ),
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
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            onPressed: () {
                              addUsertoDB(
                                  name: docnameController.text.trim(),
                                  specialisation:
                                      specialisationController.text.trim(),
                                  address1: address1Controller.text.trim(),
                                  address2: address2Controller.text.trim(),
                                  location: locationController.text.trim(),
                                  mapLink: mapLinkController.text.trim(),
                                  phone: phoneController.text.trim(),
                                  description:
                                      descriptionController.text.trim(),
                                  yearsExp: experienceController.text.trim(),
                                  date: DateFormat('dd-MM-yyyy')
                                      .format(DateTime.now()));
                            }),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => AdminHome()));
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: AppColors.themeColor),
                            )),
                      ),
                      SizedBox(
                        height: 18,
                      ),
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

  Future<void> Upload() async {
    final picker = ImagePicker(); //object of image picker
    try {
      pickedImg = await picker.pickImage(source: ImageSource.gallery);
      final String fileName = path.basename(pickedImg!
          .path); //to fetch only the base name(filename+extension only)
      File imageFile = File(pickedImg!.path);
      try {
        await storage.ref(fileName).putFile(
            imageFile,
            SettableMetadata(customMetadata: {
              'date': DateTime.now().toString(), //optional
            }));
        setState(() {});
      } on FirebaseException catch (error) {
        print(error);
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> addUsertoDB(
      {required String name,
      required String specialisation,
      required String address1,
      required String address2,
      required String location,
      required String mapLink,
      required String phone,
      required String description,
      required String yearsExp,
      required String date}) async {
    return _userCollection.add({
      'name': name,
      'specialisation': specialisation,
      'address1': address1,
      'address2': address2,
      'location': location,
      'mapLink': mapLink,
      'phone': phone,
      'description': description,
      'yearsExp': yearsExp,
      'date': date,
      'favourites': false,
    }).then((value) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => AdminHome()));
      print("User added successfully");
      docnameController.clear();
      specialisationController.clear();
      address1Controller.clear();
      address2Controller.clear();
      locationController.clear();
      mapLinkController.clear();
      phoneController.clear();
      descriptionController.clear();
      experienceController.clear();
      Navigator.of(context).pop();
    }).catchError((error) {
      print("Failed to add data $error");
    });
  }
}
