import 'package:flutter/material.dart';

class AnotherPage extends StatelessWidget {
  final String imageUrl;

  const AnotherPage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              imageUrl,
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous page
              },
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
