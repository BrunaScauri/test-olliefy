import 'package:flutter/material.dart';

class BorderlessProfilePicture extends StatelessWidget {
  final double imageWidth;
  final double imageHeight;
  final String imagePath;
  final BoxFit imageFit;

  const BorderlessProfilePicture({
    Key? key,
    required this.imageWidth,
    required this.imageHeight,
    this.imagePath = '',
    this.imageFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: imageWidth,
      height: imageHeight,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: imageFit,
        ),
      ),
    );
  }
}
