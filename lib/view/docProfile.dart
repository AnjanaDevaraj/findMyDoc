import 'package:flutter/material.dart';

import '../Utilities/appColors.dart';

class DocProfile extends StatelessWidget {
  const DocProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.themeColor,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 20,),
                    Container(
                      width: 105,
                      height: 110,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          image:AssetImage('assets/images/doc2.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 12,),
                    Column(
                      children: [
                        Text(
                          "Dr.Jithin Jose",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "General Physician",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 18,),
                Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              topLeft: Radius.circular(20))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 14,top: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Biography",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              "Lorem ipsum dolor sit amet\nSit quam reiciendis ad  voluptatem culpa ut excepturi temporibus.\nAd expedita voluptatem sit veritatis\ndistinctio ad perferendis iure est",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Specializations",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 8,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.themeColor,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Trauma care",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.themeColor,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "Surgery care",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.themeColor,
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      "General care",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ],
                            ),
                            SizedBox(height: 60,),
                            Center(
                              child:
                              ElevatedButton(
                                onPressed: () {
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.white),
                                  elevation: MaterialStateProperty.all(5),
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: AppColors.themeColor),
                                    ),
                                  ),
                                  minimumSize: MaterialStateProperty.all(Size(450, 45)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 12),
                                  child: Text(
                                    "Book an appointment",
                                    style: TextStyle(
                                      color: AppColors.themeColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              )
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
