import 'package:flutter/material.dart';

class ExtraActivities extends StatefulWidget {
  const ExtraActivities({super.key});

  @override
  State<ExtraActivities> createState() => _ExtraActivitiesState();
}

class _ExtraActivitiesState extends State<ExtraActivities> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Text(
                    'Non technical events ',
                    style: TextStyle(
                        fontStyle: FontStyle.italic, color: Colors.white),
                  ),
                  Icon(
                    Icons.sports,
                    color: Color.fromARGB(255, 243, 4, 191),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            )
          ],
        ),
        backgroundColor: Color.fromARGB(255, 30, 7, 112),
      ),
      body: Center(
        child: Text('CURRENTLY NON TECHNICAL EVENTS ARE NOT ACTIVE...!'),
      ),
    );
  }
}
