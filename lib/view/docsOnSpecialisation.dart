import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Utilities/appColors.dart';
import '../firebase_files/firebase_crud.dart';
import '../utilities/bottomNavigation.dart';
import '../utilities/genericFns.dart';
import 'docProfile.dart';

class DocSpec extends StatefulWidget {

  final String? name;
  final String? location;

  DocSpec({super.key, this.name, this.location});

  @override
  State<DocSpec> createState() => _DocSpecState();
}

class _DocSpecState extends State<DocSpec> {
  List<Map<String, dynamic>> docList = [
    {
      'name': 'Dr.Jithin Jose',
      'specialisation': 'General physician',
      'favourite': true
    },
    {
      'name': 'Dr.Jithin Jose',
      'specialisation': 'General physician',
      'favourite': true
    },
    {
      'name': 'Dr.Jithin Jose',
      'specialisation': 'General physician',
      'favourite': true
    },
    {
      'name': 'Dr.Jithin Jose',
      'specialisation': 'General physician',
      'favourite': true
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.themeColor,
        child: Column(
          children: [
            SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, right: 12),
              child: Text(
                "${widget.name} near me",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseCRUD().readDocLocationSpec(widget.name,widget.location),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                        child: Text('Error ${snapshot.error}'));
                  }
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  final users = snapshot.data!.docs;
                  return Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  topLeft: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 12, right: 12, top: 12),
                            child: ListView.builder(
                                itemCount: users.length,
                                itemBuilder: (context, index) {
                                  final user = users[index];
                                  final name = user["name"];
                                  final address2 = user["address2"];
                                  final phone = user["phone"];
                                  return Card(
                                    elevation: 2,
                                    color: AppColors.themeColor,
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DocProfile()));
                                      },
                                      child: ListTile(
                                          title: Text(
                                            '$name',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          subtitle: Text(
                                            '$address2',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12),
                                          ),
                                          trailing: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              IconButton(
                                                icon: Icon(Icons.call,
                                                  color: Colors.white,),
                                                onPressed: () {
                                                  GenFunctions().callNumber(phone);
                                                },
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      if (!docList[index]['favourite']) {
                                                        docList[index]['favourite'] =
                                                        true;
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                            SnackBar(
                                                                content: Text(
                                                                    "Doctor added to favourites")));
                                                      } else {
                                                        docList[index]['favourite'] =
                                                        false;
                                                        ScaffoldMessenger.of(
                                                            context)
                                                            .showSnackBar(
                                                            SnackBar(
                                                                content: Text(
                                                                    "Doctor removed from favourites")));
                                                      }
                                                    });
                                                  },
                                                  icon: Icon(
                                                    !docList[index]['favourite']
                                                        ? Icons
                                                        .favorite_border
                                                        : Icons.favorite,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          )),
                                    ),
                                  );
                                }),
                          ),
                        ),
                      ));
                }
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
