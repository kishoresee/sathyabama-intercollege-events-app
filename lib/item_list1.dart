import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/add_item1.dart';
import 'package:flutter_project/item_details1.dart';
import 'package:flutter_project/utils.dart';
import 'package:url_launcher/url_launcher.dart';
import 'add_item.dart';

class ItemLiyy extends StatelessWidget {
  ItemLiyy({Key? key}) : super(key: key) {
    _stream = _reference.snapshots();
  }

  final CollectionReference _reference =
      FirebaseFirestore.instance.collection('Event_list');

  late Stream<QuerySnapshot> _stream;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              //Get.back();
            },
            child: Icon(Icons.arrow_back, color: Colors.white)),
        title: Text(
          '          Hackathon',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 151, 11, 32),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _stream,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Some error occurred ${snapshot.error}'));
          }

          if (snapshot.hasData) {
            QuerySnapshot querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot> documents = querySnapshot.docs;
            List<Map> items = documents.map((e) => e.data() as Map).toList();

            return SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: items.map((item) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => NewItemDetails(item['id']),
                          ));
                        },
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (item.containsKey('image'))
                                Image.network(
                                  item['image'],
                                  height: 450,
                                  fit: BoxFit.cover,
                                ),
                              SizedBox(height: 8),
                              Center(
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 110,
                                    ),
                                    Text(
                                      'EVENT:',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      item['name'],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 4),
                              ElevatedButton(
                                onPressed: () async {
                                  if (item.containsKey('quantity') &&
                                      item['quantity'] != null) {
                                    final urlString = '${item['quantity']}';
                                    final uri = Uri.parse(urlString);
                                    if (await canLaunchUrl(uri)) {
                                      await launchUrl(uri);
                                    } else {
                                      Utils.showSnackBar(
                                          context, 'Could not launch $uri');
                                    }
                                  } else {
                                    Utils.showSnackBar(context,
                                        'Quantity is not available for this item.');
                                  }
                                },
                                child: Text('Apply'),
                              ),

                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          bool? isPasswordCorrect = await _checkPassword(context);
          if (isPasswordCorrect == true) {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => NewAddItem()));
          }
        },
        tooltip: 'Add Item',
        child: Icon(Icons.add),
      ),
    );
  }

  Future<bool?> _checkPassword(BuildContext context) async {
    String password = '';
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Enter Password'),
          content: TextField(
            onChanged: (value) {
              password = value;
            },
            obscureText: true,
            decoration: InputDecoration(hintText: 'Enter password'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(password == 'evesist');
              },
            ),
          ],
        );
      },
    );
  }
}
