import 'package:flutter/material.dart';

class CustomePainterTest extends StatefulWidget {
  const CustomePainterTest({super.key});

  @override
  CustomePainterTestState createState() => CustomePainterTestState();
}

class CustomePainterTestState extends State<CustomePainterTest> {
  //ToDo: 01 add getLocation fun
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CustomPaint(
              size: Size(300, 170),
              painter: MyPainter(30),
            ),
          ),

          // ElevatedButton(
          //   onPressed: () {
          //     //ToDo: 02 Get the current location
          //   },
          //   child: const Text('Get Location'),
          // ),
        ],
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double borderRadius;

  final Paint _borderPaint = Paint()
    ..color = Colors.grey.shade300
    ..strokeWidth = 1.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.round;

  final Paint _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 1.0
    ..style = PaintingStyle.fill
    ..strokeJoin = StrokeJoin.round;

  MyPainter(this.borderRadius);

  @override
  void paint(Canvas canvas, Size size) {
    double x = size.width;
    double y = size.height;
    double arc = borderRadius;
    double yFactor = y * 0.4;
    double xFactor = x * 0.5;
    var path = Path();
    path.moveTo(arc, 0);
    path.lineTo((xFactor) - arc, 0);
    path.quadraticBezierTo(xFactor, 0, xFactor, arc);
    path.lineTo(xFactor, yFactor - arc);
    path.quadraticBezierTo(xFactor, yFactor, xFactor + arc, yFactor);
    path.lineTo(x - arc, yFactor);
    path.quadraticBezierTo(x, yFactor, x, yFactor + arc);
    path.lineTo(x, y - arc);
    path.quadraticBezierTo(x, y, x - arc, y);
    path.lineTo(arc, y);
    path.quadraticBezierTo(0, y, 0, y - arc);
    path.lineTo(0, arc);
    path.quadraticBezierTo(0, 0, arc, 0);

    // path.lineTo(150, 50);
    // path.quadraticBezierTo(200, 50, 200, 100);
    // path.quadraticBezierTo(200, 150, 250, 150);
    // path.lineTo(300, 150);
    // path.quadraticBezierTo(350, 150, 350, 200);
    // path.lineTo(350, 250);
    // path.quadraticBezierTo(350, 300, 300, 300);
    // path.lineTo(50, 300);
    // path.quadraticBezierTo(0, 300, 0, 250);
    // path.lineTo(0, 100);
    // path.quadraticBezierTo(0, 50, 50, 50);
    canvas.drawPath(path, _paint);
    canvas.drawPath(path, _borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
