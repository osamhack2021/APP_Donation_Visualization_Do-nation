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
    final backGroundPaint = Paint()
      ..color = const Color(0xaa123456)
      ..style = PaintingStyle.fill;
    canvas.drawRect(outerBox, backGroundPaint);
    paintImageWithBoxfit(image, outerBox, canvas, paint, BoxFit.fill);
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
  final CustomPoint p1;
  final CustomPoint p2;
  final int color;

  const OverlayBoxPainter(
    this.p1,
    this.p2,
    this.color,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final outerBox = const ui.Offset(0, 0) & Size(size.width, size.height);
    final backGroundPaint = Paint()
      ..color = const Color(0xaa333333)
      ..style = PaintingStyle.fill;
    // canvas.drawRect(outerBox, backGroundPaint);
    var overlapBoxPaint = Paint()
      ..color = Color(color)
      ..style = PaintingStyle.fill;
    canvas.drawRect(getHighlightBox(size), overlapBoxPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;

  Rect getHighlightBox(Size size) {
    print(p1.x);
    print(p1.y);
    final _p1 = Offset(size.width * p1.x, size.height * p1.y);
    final _p2 = Offset(size.width * p2.x, size.height * p2.y);
    // final _p1 = Offset(size.width * 48, size.height * 21);
    // final _p2 = Offset(size.width * 578, size.height * 42);
    final newHighlightBox = Rect.fromPoints(_p1, _p2);
    return newHighlightBox;
  }
}

class CustomPoint {
  final double x;
  final double y;

  CustomPoint(this.x, this.y);
}
