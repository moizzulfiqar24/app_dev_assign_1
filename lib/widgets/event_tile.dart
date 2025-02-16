import 'package:flutter/material.dart';

class MyEventTile extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String eventAddress;
  final String eventPerson;
  final String imagePath;

  const MyEventTile({
    super.key,
    required this.eventName,
    required this.eventDate,
    required this.eventAddress,
    required this.eventPerson,
    this.imagePath = 'assets/images/conf.jpg', 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: Column(
          children: [
            ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  imagePath,
                  width: 89,
                  height: 77,
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                eventName,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(eventDate),
                  Text(eventAddress),
                  Text(eventPerson),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
