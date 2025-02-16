import 'package:flutter/material.dart';

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
            child: Padding(
              padding: const EdgeInsets.only(
                left: 41,
                right: 100,
                bottom: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      CustomPaint(
                        size: const Size(17, 18),
                        painter: BoldCurvedLeftUpArrowPainter(Colors.grey),
                      ),
                      const SizedBox(width: 3),
                      Expanded(
                        child: Text(
                          '"$comment"',
                          style: const TextStyle(
                            fontSize: 14.5,
                            color: Color(0xFF929292),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
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
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}

class BoldCurvedLeftUpArrowPainter extends CustomPainter {
  final Color color;

  BoldCurvedLeftUpArrowPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 3.5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    path.moveTo(size.width - 4, size.height);
    path.lineTo(7, size.height);
    path.quadraticBezierTo(-size.width * 0.1, size.height, 0, 0);
    path.moveTo(0, 0);
    path.lineTo(-size.width * 0.3, size.height * 0.3);
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.3, size.height * 0.3);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
