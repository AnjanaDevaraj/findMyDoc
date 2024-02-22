import 'package:findmydoc/Utilities/appColors.dart';
import 'package:findmydoc/view/docProfile.dart';
import 'package:flutter/material.dart';

import '../utilities/bottomNavigation.dart';

class DocResult extends StatefulWidget {
  const DocResult({super.key});

  @override
  State<DocResult> createState() => _DocResultState();
}

class _DocResultState extends State<DocResult> {
  bool favourite = false;

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
      'favourite': false
    },
    {
      'name': 'Dr.Jithin Jose',
      'specialisation': 'General physician',
      'favourite': true
    },
    {
      'name': 'Dr.Jithin Jose',
      'specialisation': 'General physician',
      'favourite': false
    },
    {
      'name': 'Dr.Jithin Jose',
      'specialisation': 'General physician',
      'favourite': false
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose your doctor",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: docList.length,
        itemBuilder: (context, index) => Card(
          elevation: 2,
          color: AppColors.themeColor,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DocProfile(),
              ));
            },
            child: ListTile(
              title: Text(
                docList[index]['name'],
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                docList[index]['specialisation'],
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.call,
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (!docList[index]['favourite']) {
                          docList[index]['favourite'] = true;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Doctor added to favourites"),
                            ),
                          );
                        } else {
                          docList[index]['favourite'] = false;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Doctor removed from favourites"),
                            ),
                          );
                        }
                      });
                    },
                    icon: Icon(
                      !docList[index]['favourite']
                          ? Icons.favorite_border
                          : Icons.favorite,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
,
      bottomNavigationBar: BottomNavigationWidget(),
    );
  }
}
