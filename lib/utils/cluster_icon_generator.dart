import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:test_olliefy/utils/styles/texts.dart';

Future<BitmapDescriptor> getClusterBitmap(int size) async {
  final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint = Paint()..color = Colors.black;

  const double sizeCircle = 100;

  canvas.drawCircle(
    const Offset(sizeCircle / 2, sizeCircle / 2),
    sizeCircle / 2,
    paint,
  );

  TextPainter textPainter = TextPainter(
    textDirection: TextDirection.ltr,
    text: TextSpan(
      text: size.toString(),
      style: TextsStyles.mapClusteringNumber(),
    ),
  );

  textPainter.layout();
  textPainter.paint(
    canvas,
    Offset(
      (sizeCircle - textPainter.width) / 2,
      (sizeCircle - textPainter.height) / 2,
    ),
  );

  final ui.Image img = await pictureRecorder.endRecording().toImage(sizeCircle.toInt(), sizeCircle.toInt());
  final ByteData? byteData = await img.toByteData(format: ui.ImageByteFormat.png);
  final Uint8List uint8List = byteData!.buffer.asUint8List();

  return BitmapDescriptor.bytes(uint8List);
}
