import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyCommentsTile extends StatelessWidget {
  final String eventName;
  final String comment;
  final String eventDate;

  const MyCommentsTile({
    super.key,
    required this.eventName,
    required this.comment,
    required this.eventDate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Material(
            // borderRadius: BorderRadius.circular(10),
            // elevation: 2,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 41,
                right: 100,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title
                  Text(
                    eventName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // Row containing left-up arrow and comment
                  // Row(
                  //   children: [
                  //     const Icon(
                  //       Icons.turn_right, // This is the left-up curved arrow
                  //       size: 18,
                  //       color: Colors.grey,
                  //     ),
                  //     const SizedBox(width: 5),
                  //     Expanded(
                  //       child: Text(
                  //         '"$comment"',
                  //         style: const TextStyle(
                  //           fontSize: 14,
                  //           color: Color(0xFF929292),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/bold_left_up_arrow.svg', // Path to your SVG file
                        width: 18, // Set the size
                        height: 18,
                        colorFilter: const ColorFilter.mode(Colors.grey,
                            BlendMode.srcIn), // Change color if needed
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          '"$comment"',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF929292),
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  // Event Date
                  Text(
                    eventDate,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Color(0xFF929292),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          const Divider(color: Colors.grey), // Line under the tile
        ],
      ),
    );
  }
}
