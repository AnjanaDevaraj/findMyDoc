import 'package:findmydoc/Utilities/appColors.dart';
import 'package:flutter/material.dart';

class DocResult extends StatelessWidget {
  const DocResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Choose your doctor",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView(
            children: List.generate(
                6,
                (index) => Card(
                  color: AppColors.themeColor,
                      child: ListTile(
                          title: Text(
                            "Dr.Jithin Jose",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          subtitle: Text(
                            "General Physician",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.call, color: Colors.white,),
                              Icon(Icons.favorite_border, color: Colors.white,),
                            ],
                          )
                      ),
                    ))));
  }
}
