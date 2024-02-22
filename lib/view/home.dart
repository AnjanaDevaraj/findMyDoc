import 'package:carousel_slider/carousel_slider.dart';
import 'package:findmydoc/Utilities/appColors.dart';
import 'package:findmydoc/utilities/appAssets.dart';
import 'package:findmydoc/view/docsOnSpecialisation.dart';
import 'package:findmydoc/view/searchDoc.dart';
import 'package:flutter/material.dart';

import '../utilities/bottomNavigation.dart';
import 'docProfile.dart';

class HomePage extends StatefulWidget {
  final String? name;

  HomePage({super.key, this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showMore = false;
  List<Map<String, dynamic>> docList = [
    {
      'image': 'assets/images/doc2.jpg',
      'docName': 'Dr.Jithin Jose',
      'spec': 'General Medicine'
    },
    {
      'image': 'assets/images/doc2.jpg',
      'docName': 'Dr.Jithin Jose',
      'spec': 'General Medicine'
    },
    {
      'image': 'assets/images/doc2.jpg',
      'docName': 'Dr.Jithin Jose',
      'spec': 'General Medicine'
    },
    {
      'image': 'assets/images/doc2.jpg',
      'docName': 'Dr.Jithin Jose',
      'spec': 'General Medicine'
    },
    {
      'image': 'assets/images/doc2.jpg',
      'docName': 'Dr.Jithin Jose',
      'spec': 'General Medicine'
    },
  ];

  List<Map<String, dynamic>> categoryName = [
    {
      'layman': 'General medicine',
      'medicalterm': 'General Practitioners',
      'image': AppAssets.firstAid,
    }, {
      'layman': 'Dental',
      'medicalterm': 'Dentists',
      'image': AppAssets.dental,
    }, {
      'layman': 'Heart',
      'medicalterm': 'Cardiologists',
      'image': AppAssets.heart,
    }, {
      'layman': 'Stomach',
      'medicalterm': 'Gastroenterologists',
      'image': AppAssets.stomach,
    }, {
      'layman': 'Lungs',
      'medicalterm': 'Pulmonologist',
      'image': AppAssets.lungs,
    }, {
      'layman': 'Bones&Muscles',
      'medicalterm': 'Orthopedists',
      'image': AppAssets.bonesMuscles,
    }, {
      'layman': 'Skincare',
      'medicalterm': 'Dermatologists',
      'image': AppAssets.skincare,
    }, {
      'layman': 'Gynecology',
      'medicalterm': 'Gynecologists',
      'image': AppAssets.gynaec,
    }, {
      'layman': 'Elderly Health',
      'medicalterm': 'Geriatricians',
      'image': AppAssets.elderly,
    }, {
      'layman': 'Child Health',
      'medicalterm': 'Pediatricians',
      'image': AppAssets.child,
    }, {
      'layman': 'Psychology',
      'medicalterm': 'Psychiatrists and Psychologists',
      'image': AppAssets.psychology,
    }, {
      'layman': 'ENT',
      'medicalterm': 'ENT Specialists',
      'image': AppAssets.ent,
    }, {
      'layman': 'Eye care',
      'medicalterm': 'Ophthalmologists',
      'image': AppAssets.eyecare,
    }, {
      'layman': 'Brain&Nerves',
      'medicalterm': 'Neurologists',
      'image': AppAssets.brain,
    }, {
      'layman': 'Sleep health',
      'medicalterm': 'Sleep Medicine Specialists',
      'image': AppAssets.sleep,
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // GestureDetector(
                  //   onTap: () {
                  //     // Navigate to the search result page
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) => SearchDoc(),
                  //       ),
                  //     );
                  //   },
                  //   child: Padding(
                  //     padding: EdgeInsets.only(right: 8),
                  //     child: TextField(
                  //       decoration: InputDecoration(
                  //         hintStyle: TextStyle(color: Colors.grey),
                  //         hintText: "Search your doctor",
                  //         border: OutlineInputBorder(),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Text(
                    "Hi ${widget.name}!",
                    style: TextStyle(
                        color: AppColors.themeColorBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.location_on_outlined,
                          color: AppColors.themeColorBlack,
                        ),
                        Text(
                          "Kakkanad",
                          style: TextStyle(
                            color: AppColors.themeColorBlack,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Let\'s find your doctor",
                style: TextStyle(color: AppColors.themeColorGrey, fontSize: 14),
              ),
              SizedBox(
                height: 8,
              ),
              GestureDetector(
                onTap: () {
                  // Navigate to another page when tapped
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SearchDoc()));
                },
                child: Container(
                  height: 40,
                  padding: EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey[200],
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search),
                      SizedBox(width: 8),
                      Text(
                        "Search here",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(
                height: 20,
              ),
              Text(
                "Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                height: (showMore
                    ? (MediaQuery
                    .of(context)
                    .size
                    .width / 4) *
                    ((categoryName.length / 4).ceil())
                    : 100),
                // Set a minimum height when showMore is false
                child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: (showMore
                      ? categoryName.length
                      : categoryName.length > 4
                      ? 4
                      : categoryName.length),
                  itemBuilder: (BuildContext context, int index) {
                    if (!showMore && index >= 4)
                      return SizedBox
                          .shrink(); // Hide items when not showing more
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DocSpec(name: categoryName[index]['medicalterm'])));
                      },
                      child: GridTile(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.blue[100],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 12,
                              ),
                              Image.asset(
                                categoryName[index]['image'],
                                width: 50,
                                height: 30,
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                categoryName[index]['layman'],
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                // Handling overflow
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    showMore = !showMore;
                  });
                },
                child: Text(
                  showMore ? 'Show less' : 'Show more',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Top doctors near me",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              CarouselSlider.builder(
                itemCount: docList.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => DocProfile()));
                    },
                    child: Card(
                      elevation: 3,
                      child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height * 0.6, // Adjust height as needed
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.asset(
                                docList[index]['image'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: Column(
                                children: [
                                  Text(
                                    docList[index]['docName'],
                                    style: TextStyle(fontSize: 14),
                                  ),
                                  Text(
                                    docList[index]['spec'],
                                    style: TextStyle(fontSize: 10),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 18,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  viewportFraction: 0.5,
                ),
              ),
              SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
