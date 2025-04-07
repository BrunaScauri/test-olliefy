import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

import 'package:test_olliefy/components/atoms/selected_photos.dart';

class SelectedPhotosRow extends StatefulWidget {
  @override
  _SelectedPhotosRowState createState() => _SelectedPhotosRowState();
}

class _SelectedPhotosRowState extends State<SelectedPhotosRow> {
    List<ImageProvider> photos = [
      AssetImage('assets/marketplace_page/example_photos/1.png'),
      AssetImage('assets/marketplace_page/example_photos/2.png'),
      AssetImage('assets/marketplace_page/example_photos/3.png'),
      AssetImage('assets/marketplace_page/example_photos/3.png'),
      AssetImage('assets/marketplace_page/example_photos/1.png'),
      AssetImage('assets/marketplace_page/example_photos/2.png'),
      AssetImage('assets/marketplace_page/example_photos/3.png'),
      AssetImage('assets/marketplace_page/example_photos/1.png'),
    ];

  bool _isPhotosClicked = false;

  Future<void> selectPhotos() async {
    List<ImageProvider> newPhotos = [
      AssetImage('assets/marketplace_page/example_photos/1.png'),
      AssetImage('assets/marketplace_page/example_photos/2.png'),
      AssetImage('assets/marketplace_page/example_photos/3.png'),
      AssetImage('assets/marketplace_page/example_photos/1.png'),
    ];

    setState(() {
      photos.addAll(newPhotos);
    });
  }

  @override
  Widget build(BuildContext context) {
      if (!_isPhotosClicked || photos.isEmpty) {
      return GestureDetector(
        onTap: () {
          selectPhotos();
          setState(() {
            _isPhotosClicked = true;
          });
        },
        child: Container(
          height: 126,
          width: 343,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/profile_page/icons/empty_image.png',
                width: 100,
              ),
              Text('Add photos'),
            ],
          ),
        ),
      );
    } else {
      return Column(
        children: [
          Container(
            height: 125,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: photos.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SelectedPhotos(
                      image: photos[index],
                      onDelete: () {
                        setState(() {
                          photos.removeAt(index);
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ),
          OutlinedButton(
            onPressed: () {
              selectPhotos();
              setState(() {
                _isPhotosClicked = false;
              });
            },
            style: ButtonStyles.marketplaceButton(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.add_circle,
                  color: AppColors.primaryGold70,
                  size: 20,
                ),
                SizedBox(width: 4),
                RichText(
                  text: TextSpan(
                    style: TextStyles.elevatedButtonText(color: AppColors.primaryGray10),
                    children: [
                      TextSpan(text: 'Add more photos'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]
      );
    }
  }
}