import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double height;
  final double width;
  final Color color;
  final double dashWidth;
  final double dashGap;
  final Axis direction;
  final EdgeInsets margin;

  const DashedLine({super.key, 
    this.height = 1.0,
    this.width = 1.0,
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dashGap = 3.0,
    this.direction = Axis.horizontal,
    this.margin = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: CustomPaint(
        size: direction == Axis.horizontal
            ? Size(width, height)
            : Size(height, width),
        painter: DashedLinePainter(
          color: color,
          dashWidth: dashWidth,
          dashGap: dashGap,
          direction: direction,
        ),
      ),
    );
  }
}

class DashedLinePainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashGap;
  final Axis direction;

  DashedLinePainter({
    this.color = Colors.black,
    this.dashWidth = 5.0,
    this.dashGap = 3.0,
    this.direction = Axis.horizontal,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = direction == Axis.horizontal ? size.height : size.width
      ..style = PaintingStyle.stroke;

    final double length =
        direction == Axis.horizontal ? size.width : size.height;
    double start = 0.0;
    while (start < length) {
      final double end = start + dashWidth;
      canvas.drawPath(
        Path()
          ..moveTo(start, 0.0)
          ..lineTo(end, 0.0),
        paint,
      );
      start = end + dashGap;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
