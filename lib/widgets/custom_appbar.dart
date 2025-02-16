// import 'package:flutter/material.dart';

// class CustomAppBarShape extends OutlinedBorder {
//   const CustomAppBarShape({super.side});

//   Path _getPath(Rect rect) {
//     final Path path = Path();
//     final Size size = Size(rect.width, rect.height * 3.0);

//     // Define control points for the S-like sinusoidal curve
//     final double startY = size.height * 0.8;
//     final double peakY = size.height * 0.7;
//     final double endY = size.height * 0.8;

//     path.moveTo(0, startY);

//     // First curve - dips down
//     path.quadraticBezierTo(
//       size.width * 0.4, size.height, // Control point
//       size.width * 0.5, peakY, // End point
//     );

//     // Second curve - moves up again
//     path.quadraticBezierTo(
//       size.width * 0.75, size.height * 0.9, // Control point
//       size.width, endY, // End point
//     );

//     path.lineTo(size.width, 0);
//     path.lineTo(0, 0);
//     path.close();

//     return path;
//   }

//   @override
//   Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
//     return _getPath(rect.inflate(side.width));
//   }

//   @override
//   Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
//     return _getPath(rect);
//   }

//   @override
//   void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
//     if (rect.isEmpty) {
//       return;
//     }

//     final Paint paint = Paint()
//       ..shader = LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [
//           const Color(0xFFFCBF49), // #FCBF49
//           const Color(0xFFF77F00), // #F77F00
//           const Color(0xFFDC7100), // #DC7100
//         ],
//       ).createShader(rect);

//     canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
//   }

//   @override
//   ShapeBorder scale(double t) {
//     return CustomAppBarShape(side: side.scale(t));
//   }

//   @override
//   OutlinedBorder copyWith({BorderSide? side}) {
//     return CustomAppBarShape(side: side ?? this.side);
//   }

//   @override
//   ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
//     if (a is CustomAppBarShape) {
//       return CustomAppBarShape(side: BorderSide.lerp(a.side, side, t));
//     }
//     return super.lerpFrom(a, t);
//   }

//   @override
//   ShapeBorder? lerpTo(ShapeBorder? b, double t) {
//     if (b is CustomAppBarShape) {
//       return CustomAppBarShape(side: BorderSide.lerp(b.side, side, t));
//     }
//     return super.lerpTo(b, t);
//   }
// }

import 'package:flutter/material.dart';

class CustomAppBarShape extends OutlinedBorder {
  const CustomAppBarShape({super.side});

  Path _getPath(Rect rect) {
    final Path path = Path();
    final Size size = Size(rect.width, rect.height * 2.5);

    final double startY = size.height * 0.88;
    final double peakYLeft = size.height * 0.65;
    final double peakYRight = size.height * 1.02;
    final double endY = size.height * 0.88;
    path.moveTo(0, startY);

    path.quadraticBezierTo(
      size.width * 0.25,
      peakYLeft,
      size.width * 0.50,
      size.height * 0.96,
    );

    path.quadraticBezierTo(
      size.width * 0.80,
      peakYRight,
      size.width,
      endY,
    );

    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect.inflate(side.width));
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return _getPath(rect);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    if (rect.isEmpty) {
      return;
    }

    final Paint paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFFCBF49), // ✅ Gradient color 1
          const Color(0xFFF77F00), // ✅ Gradient color 2
          const Color(0xFFDC7100), // ✅ Gradient color 3
        ],
      ).createShader(rect);

    canvas.drawPath(getOuterPath(rect, textDirection: textDirection), paint);
  }

  @override
  ShapeBorder scale(double t) {
    return CustomAppBarShape(side: side.scale(t));
  }

  @override
  OutlinedBorder copyWith({BorderSide? side}) {
    return CustomAppBarShape(side: side ?? this.side);
  }

  @override
  ShapeBorder? lerpFrom(ShapeBorder? a, double t) {
    if (a is CustomAppBarShape) {
      return CustomAppBarShape(side: BorderSide.lerp(a.side, side, t));
    }
    return super.lerpFrom(a, t);
  }

  @override
  ShapeBorder? lerpTo(ShapeBorder? b, double t) {
    if (b is CustomAppBarShape) {
      return CustomAppBarShape(side: BorderSide.lerp(b.side, side, t));
    }
    return super.lerpTo(b, t);
  }
}
