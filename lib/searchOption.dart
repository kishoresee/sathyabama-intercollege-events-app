import 'package:flutter/material.dart';
import 'package:flutter_project/culturalsFest.dart';
import 'package:flutter_project/extraCuricular.dart';
import 'package:flutter_project/workShops.dart';
import 'package:get/get.dart';
//import 'package:flutter_project/nextPage.dart';

class MySearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else
              () {
                query = '';
              };
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
        child: Text(
      query,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'Hackathons',
      'Internships',
      'extracurricular',
    ];

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index]; // Changed variable name here
        return Column(
          children: [
            ListTile(
              title: Text(suggestion),
              onTap: () {
                Get.to(ExtraCurricular());
              },
            ),
           
          ],
        );
      },
    );
    
  }
}
