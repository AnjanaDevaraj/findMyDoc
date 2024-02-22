import 'package:flutter/material.dart';

import '../Utilities/appColors.dart';
import '../utilities/bottomNavigation.dart';
import 'docProfile.dart';

class DocSpec extends StatefulWidget {

  final String? name;
  DocSpec({super.key, this.name});
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
            Expanded(
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
                  padding: const EdgeInsets.only(left: 12,right: 12, top: 12),
                  child: ListView.builder(
                      itemCount: docList.length,
                      itemBuilder: (context, index) => Card(
                        elevation: 2,
                            color: AppColors.themeColor,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) => DocProfile()));
                              },
                              child: ListTile(
                                  title: Text(
                                    docList[index]['name'],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  subtitle: Text(
                                    docList[index]['specialisation'],
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                       icon: Icon( Icons.call,
                                         color: Colors.white,), onPressed: () {
                                      },
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              if (!docList[index]['favourite']) {
                                                docList[index]['favourite'] = true;
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Doctor added to favourites")));
                                              } else {
                                                docList[index]['favourite'] = false;
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(
                                                            "Doctor removed from favourites")));
                                              }
                                            });
                                          },
                                          icon: Icon(
                                            !docList[index]['favourite']
                                                ? Icons.favorite_border
                                                : Icons.favorite,
                                            color: Colors.white,
                                          ))
                                    ],
                                  )),
                            ),
                          )),
                ),
              ),
            ))
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
