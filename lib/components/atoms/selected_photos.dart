import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';

class SelectedPhotos extends StatelessWidget {
  final ImageProvider image;
  final VoidCallback? onDelete;

  const SelectedPhotos({Key? key, required this.image, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(
          color: AppColors.primaryGray5,
          width: 1.0,
        ),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image(
              image: image,
              fit: BoxFit.fill,
              height: 125,
            ),
          ),
          Positioned(
            top: 8.0,
            right: 8.0,
            child: GestureDetector(
              onTap: onDelete,
              child: Container(
                height: 24,
                width: 24,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/marketplace_page/delete_photo_icon.png',
                    ),
                  ),
                ),
              ),
            )
          ),
        ],
      ),
    );
  }
}