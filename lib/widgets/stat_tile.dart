import 'package:flutter/material.dart';

class MyStatsTile extends StatelessWidget {
  const MyStatsTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: const [
            Text(
              '19',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF77F00), // Orange color
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Posts',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(width: 100), // Space between the two columns
        Column(
          children: const [
            Text(
              '32',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF77F00), // Orange color
              ),
            ),
            SizedBox(height: 3),
            Text(
              'Comments',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
