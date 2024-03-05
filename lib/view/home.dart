import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:findmydoc/Utilities/appColors.dart';
import 'package:findmydoc/utilities/appAssets.dart';
import 'package:findmydoc/view/docsOnSpecialisation.dart';
import 'package:findmydoc/view/profile.dart';
import 'package:findmydoc/view/searchDoc.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

import '../firebase_files/firebase_crud.dart';
import '../utilities/appStringConstants.dart';
import '../utilities/bottomNavigation.dart';
import 'docProfile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  final String? name;

  HomePage({super.key, this.name});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<String>? _futureCity;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool showMore = false;

  final locationController = TextEditingController(text: "Kakkanad");

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

  String _greetUser() {
    var hour = DateTime
        .now()
        .hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 18) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  Future<void> _fetchUserLocation() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    final city = placemarks.first.locality ?? 'Unknown';
    setState(() {
      _futureCity = Future.value(city);
    });
  }

  Future<void> _refreshUserLocation() async {
    final status = await Geolocator.checkPermission();
    if (status == LocationPermission.denied ||
        status == LocationPermission.deniedForever) {
      return;
    }
    _fetchUserLocation();
  }

  @override
  void initState() {
    super.initState();
    //  _fetchUserLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      ///appbar
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, right: 8.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                Container(
                  height: 60,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.34,
                  decoration: BoxDecoration(
                    color: AppColors.themeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<String>(
                    style: TextStyle(color: AppColors.themeColor),
                    dropdownColor: AppColors.themeColor,
                    // Set the background color of the dropdown list to white
                    decoration: InputDecoration(
                      // prefixIcon: Icon(Icons.search),
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      border: OutlineInputBorder(),
                    ),
                    items: AppStringConstants.cities.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 11,
                              color: Colors.white
                          ), // Set text color within the dropdown list to AppColors.themeColor
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // Handle dropdown value change here
                      locationController.text = newValue!;
                    },
                    value: locationController.text,
                  ),
                )

              ],
            ),
          ),
        ],
        backgroundColor: AppColors.themeColor,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8, left: 8),
          child: GestureDetector(
            onTap: () {
              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => ProfilePage()));
              _scaffoldKey.currentState?.openDrawer();
            },
            child: CircleAvatar(
              backgroundImage: AssetImage("assets/images/doc2.jpg"),
            ),
          ),
        ),
        title: Text(
          _greetUser(),
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),

      ///drawer
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            DrawerHeader(
              child: UserAccountsDrawerHeader(
                  accountName: Text("User"), accountEmail: Text("")),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favourites'),
              onTap: () {
                Navigator.pushNamed(context, '/favourites');
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                _showLogoutPopup(context);
              },
            ),
          ],
        ),
      ),

      ///body begins here
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: AppColors.themeColor,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 6,
                        ),
                        Text(
                          "How are you feeling\ntoday?",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 23,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to another page when tapped
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SearchDoc()));
                          },
                          child: Material(
                            elevation: 5,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: 40,
                              padding: EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: Icon(Icons.search),
                                  ),
                                  Text(
                                    "Search here",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 12),
                          child: Text(
                            "Categories",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          height: (showMore
                              ? (MediaQuery
                              .of(context)
                              .size
                              .width / 4) *
                              ((AppStringConstants.categoryName.length / 4)
                                  .ceil())
                              : 120),
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                            SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 6,
                              crossAxisSpacing: 3,
                            ),
                            itemCount: (showMore
                                ? AppStringConstants.categoryName.length
                                : AppStringConstants.categoryName.length > 4
                                ? 4
                                : AppStringConstants.categoryName.length),
                            itemBuilder: (BuildContext context, int index) {
                              if (!showMore && index >= 4)
                                return SizedBox
                                    .shrink(); // Hide items when not showing more
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          DocSpec(
                                              name: AppStringConstants
                                                  .categoryName[index]
                                              ['medicalterm'],location:locationController.text)));
                                },
                                child: GridTile(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      // color: Colors.blue[50],
                                      color: AppColors.themeColorLight,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 12,
                                        ),
                                        Image.asset(
                                          AppStringConstants.categoryName[index]
                                          ['image'],
                                          width: 50,
                                          height: 30,
                                        ),
                                        SizedBox(
                                          height: 6,
                                        ),
                                        Text(
                                          AppStringConstants.categoryName[index]
                                          ['layman'],
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
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
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 14),
                          child: Text(
                            "Top doctors near me",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        StreamBuilder<QuerySnapshot>(
                            stream: FirebaseCRUD().readDocLocation(locationController.text),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error ${snapshot.error}'));
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return Center(
                                    child: CircularProgressIndicator());
                              }
                              final users = snapshot.data!.docs;
                              return Expanded(
                                child:CarouselSlider.builder(
                                  itemCount: users.length,
                                  itemBuilder:
                                      (BuildContext context, int index, int realIndex) {
                                       final user = users[index];
                                       final name = user["name"];
                                       final specialisation = user["specialisation"];
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) => DocProfile()));
                                      },
                                      child: Card(
                                        elevation: 2,
                                        child: Container(
                                          width: double.infinity,
                                          height: MediaQuery.of(context).size.height *
                                              0.4, // Adjust height as needed
                                          child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Image.asset(
                                                  docList[index]['image'],
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Center(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      '$name',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold),
                                                    ),
                                                    Text(
                                                      '$specialisation',
                                                      style: TextStyle(fontSize: 14),
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets.only(top: 2),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        children: [
                                                          Icon(
                                                            Icons.location_on_outlined,
                                                            size: 14,
                                                          ),
                                                          Text(
                                                            locationController.text,
                                                            style:
                                                            TextStyle(fontSize: 12),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                          left: 16, right: 16),
                                                      child: ElevatedButton(
                                                          style:
                                                          ElevatedButton.styleFrom(
                                                              backgroundColor:
                                                              AppColors
                                                                  .themeColor),
                                                          onPressed: () {},
                                                          child: Row(
                                                            mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                            children: [
                                                              Icon(
                                                                Icons.call,
                                                                color: Colors.white,
                                                              ),
                                                              Text(
                                                                "Book",
                                                                style: TextStyle(
                                                                    color:
                                                                    Colors.white),
                                                              ),
                                                            ],
                                                          )),
                                                    )
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
                                    height: 260,
                                    enableInfiniteScroll: false,
                                    viewportFraction: 0.5,
                                    aspectRatio: 16 / 9,
                                  ),
                                ),);
                            }

                        ),
                        SizedBox(
                          height: 8,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom area of the page set to white
          // Container(
          //   color: Colors.white,
          //   // Add padding or other widgets here if needed
          // ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(100), // Adjust the radius as needed
      //   ),
      //   onPressed: () {
      //   //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Emergency3()));
      //   },
      //   backgroundColor: Colors.red[600],
      //   child: Icon(
      //     Icons.call,
      //     color: Colors.white,
      //   ),
      // ),
    );
  }

  void _showLogoutPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout confirmation"),
          content: Text("Are you sure you want to logout?"),
          actions: <Widget>[
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Logout"),
              onPressed: () async {
                Navigator.pop(context);
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login',
                      (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
