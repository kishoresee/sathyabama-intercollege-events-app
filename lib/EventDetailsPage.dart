import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventDetailsPage extends StatelessWidget {
  final String documentId;
  final String imageUrl;
  final String name;
  final String venue;

  const EventDetailsPage({
    Key? key,
    required this.documentId,
    required this.imageUrl,
    required this.name,
    required this.venue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 20),
          Text('Name: $name'),
          Text('Venue: $venue'),
        ],
      ),
    );
  }
}
