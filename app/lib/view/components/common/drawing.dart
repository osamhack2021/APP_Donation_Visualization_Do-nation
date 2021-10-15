import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ImagePainter extends CustomPainter {
  final ui.Image image;

  const ImagePainter(this.image);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final outerBox = const ui.Offset(0, 0) &
        Size(size.width, size.height); //box with full size
    paintImageWithBoxfit(image, outerBox, canvas, paint, BoxFit.scaleDown);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  void paintImageWithBoxfit(
    ui.Image image,
    Rect outputRect,
    Canvas canvas,
    Paint paint,
    BoxFit fit,
  ) {
    final Size imageSize = Size(
      image.width.toDouble(),
      image.height.toDouble(),
    );
    final FittedSizes sizes = applyBoxFit(
      fit,
      imageSize,
      outputRect.size,
    );
    final Rect inputSubrect = Alignment.center.inscribe(
      sizes.source,
      Offset.zero & imageSize,
    );
    final Rect outputSubrect = Alignment.center.inscribe(
      sizes.destination,
      outputRect,
    );
    canvas.drawImageRect(
      image,
      inputSubrect,
      outputSubrect,
      paint,
    );
  }
}

class OverlayBoxPainter extends CustomPainter {
  final double x1Coord;
  final double y1Coord;
  final double x2Coord;
  final double y2Coord;
  final int color;

  const OverlayBoxPainter(
    this.x1Coord,
    this.y1Coord,
    this.x2Coord,
    this.y2Coord,
    this.color,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final overlapBox = Rect.fromPoints(
      getOffset(x1Coord, y1Coord, size),
      getOffset(x2Coord, y2Coord, size),
    );
    var overlapBoxPaint = Paint()
      ..color = Color(color)
      ..style = PaintingStyle.fill;
    canvas.drawRect(overlapBox, overlapBoxPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  ui.Offset getOffset(double x, double y, Size size) =>
      Offset(size.width * x, size.height * y);
}
