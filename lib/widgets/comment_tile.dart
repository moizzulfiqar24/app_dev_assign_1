import 'package:flutter/material.dart';

class MyCommentsTile extends StatelessWidget {
  const MyCommentsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: ListTile(
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              'assets/images/conf.jpg',
              width: 89,
              height: 77,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            'Lols',
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('30 November 2024, 9:00 AM'),
              Text('13th Street, Park Avenue'),
              Text('John Doe'),
            ],
          ),
        ),
      ),
    );
  }
}
