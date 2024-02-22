import 'package:findmydoc/Utilities/appColors.dart';
import 'package:flutter/material.dart';

import 'addDoctor.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: AdminHome(),
  ));
}

class AdminHome extends StatelessWidget {
  AdminHome({super.key});

  final daysController = TextEditingController(text: "Last 30 days");

  List<String> days = [
    "Last 15 days",
    "Last 30 days",
    "Last 3 months",
    "Last 6 months",
    "Last 1 year",
    "All",
  ];

  @override
  // void initState() {
  //   daysController.text = "Last 30 days";
  //   super.initState();
  // }
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Hi Admin!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    height: 30,
                    width: 120,
                    // padding: EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.grey[200],
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 4,
                        ),
                        Icon(Icons.search),
                        SizedBox(width: 4),
                        Text(
                          "Search",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            // Wrap the Row with Expanded
                            child: Row(
                              children: [
                                Container(
                                  height: 50,
                                  width: 135,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      // prefixIcon: Icon(Icons.search),
                                      hintStyle: TextStyle(
                                          color: AppColors.themeColorGrey),
                                      border: OutlineInputBorder(),
                                    ),
                                    items: days.map((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(fontSize: 13),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      // Handle dropdown value change here
                                      daysController.text = newValue!;
                                    },
                                    value: daysController.text,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                InkWell(
                                  child: Container(
                                    height: 50,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black38,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: 6,
                                        ),
                                        Icon(Icons.filter_alt_outlined),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text("Filter"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(100, 50),
                              backgroundColor: AppColors.themeColor,
                            ),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (context) => AddDoctor()));
                            },
                            // shape: RoundedRectangleBorder(
                            //   borderRadius: BorderRadius.circular(3),
                            // ),
                            child: Text(
                              'Add Doctor',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) => Card(
                              child: ListTile(
                                leading: CircleAvatar(
                                  radius: 30,
                                    child: Image.asset(
                                        "assets/images/doc1.jpeg")),
                                tileColor: Colors.white,
                                title: Text(
                                  "Dr. Jithin Jose",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                  "General Physician",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14),
                                ),
                                trailing: Wrap(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                  builder: (context) => AddDoctor()));
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.delete)),
                                  ],
                                ),
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
