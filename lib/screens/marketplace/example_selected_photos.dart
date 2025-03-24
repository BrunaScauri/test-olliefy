import 'package:flutter/material.dart';

import 'package:test_olliefy/components/atoms/selected_photos.dart';

class SelectedPhotosRow extends StatefulWidget {
  @override
  _SelectedPhotosRowState createState() => _SelectedPhotosRowState();
}

class _SelectedPhotosRowState extends State<SelectedPhotosRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/1.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/2.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/3.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/3.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/2.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/3.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/3.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/2.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/3.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/3.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/2.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/3.png')),
            SizedBox(width: 8),
            SelectedPhotos(image: AssetImage('assets/marketplace_page/example_photos/3.png')),
          ],
        ),
      ),
    );
  }
}