import 'package:findmydoc/view/docResult.dart';
import 'package:findmydoc/view/home.dart';
import 'package:flutter/material.dart';

import '../Utilities/appColors.dart';

class SearchDoc extends StatelessWidget {
  SearchDoc({super.key});

  final locationController = TextEditingController();
  final specialityController = TextEditingController(text: 'General medicine');
  final availabilityController = TextEditingController();

  List<String> specialities = [
    "General medicine",
    "Dentistry",
    "Cardiology",
    "Gastroenterology",
    "Pulmonology",
    "Orthopedics",
    "Dermatology",
    "Obstetrics and Gynecology",
    "Geriatrics",
    "Pediatrics",
    "Psychiatry",
    "ENT",
    "Ophthalmology",
    "Neurology",
    "Sleep Medicine",
    "Allergy & Immunology",
    "Anesthesiology",
    "Endocrinology",
    "Hematology",
    "Nephrology",
    "Oncology",
    "Neurology",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.themeColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12,top: 20),
              child: Text(
                "Search Doctor",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12,right: 12,top: 20),
                    child: Container(
                      // height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonFormField<String>(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: "Speciality",
                          hintStyle: TextStyle(color: AppColors.themeColorGrey),
                          border: OutlineInputBorder(),
                        ),
                        items: specialities.map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          // Handle dropdown value change here
                          specialityController.text = newValue!;
                        },
                        value: specialityController.text,
                      ),
                    ),
                  )
                  ,
                  SizedBox(
                    height: 16,
                  ),

                  ///Location
                  Padding(
                    padding: EdgeInsets.only(right: 12,left: 12),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.location_on_outlined,),
                            hintStyle:
                            TextStyle(color: AppColors.themeColorGrey),
                            hintText: "Location",
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  ///Availibility
                  Padding(
                    padding: EdgeInsets.only(right: 12,left: 12),
                    child: Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: availabilityController,
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.calendar_month),
                            hintStyle:
                            TextStyle(color: AppColors.themeColorGrey),
                            hintText: "Availibility",
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: MaterialButton(
                        height: 45,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(3),
                        ),
                        color: AppColors.themeColor,
                        child: Text(
                          "Find Doctor",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => DocResult()));
                        }),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: AppColors.themeColor),
                        )),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
