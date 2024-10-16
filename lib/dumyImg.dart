import 'package:flutter/material.dart';

class ImgRetrive extends StatelessWidget {
  final String imageUrl;

  const ImgRetrive({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Image'),
      ),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
