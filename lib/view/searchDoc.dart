import 'package:findmydoc/view/docResult.dart';
import 'package:flutter/material.dart';

import '../Utilities/appColors.dart';

class SearchDoc extends StatelessWidget {
  SearchDoc({super.key});

  final locationController = TextEditingController();
  final specialityController = TextEditingController();
  final availabilityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text(
              "Search Doctor",
              style: TextStyle(
                color: AppColors.themeColorBlack,
                fontWeight: FontWeight.bold,
              fontSize: 18),
            ),
            SizedBox(
              height: 14,
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: AppColors.themeColorBlack,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: TextField(
                        controller: specialityController,
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: AppColors.themeColorGrey),
                            hintText: "Speciality",
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),

            ///Location
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.themeColorBlack,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: TextField(
                        controller: locationController,
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: AppColors.themeColorGrey),
                            hintText: "Location",
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),

            ///Availibility
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.calendar_month,
                      color: AppColors.themeColorBlack,
                    ),
                    SizedBox(
                      width: 6,
                    ),
                    Expanded(
                      child: TextField(
                        controller: availabilityController,
                        decoration: InputDecoration(
                            hintStyle:
                                TextStyle(color: AppColors.themeColorGrey),
                            hintText: "Availibility",
                            border: OutlineInputBorder()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Center(
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  color: AppColors.themeColor,
                  child: Text(
                    "Find Doctor",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
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
              child: TextButton(onPressed: () {}, child: Text("Cancel", style: TextStyle(color: AppColors.themeColor),)),
            ),
          ],
        ),
      ),
    );
  }
}
