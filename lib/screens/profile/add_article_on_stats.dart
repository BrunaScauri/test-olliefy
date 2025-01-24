import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/components/molecules/profile_picture_molecule.dart';
import 'package:test_olliefy/components/atoms/drag_bar.dart';

import 'package:test_olliefy/screens/profile/edit_user_profile.dart';

class AddArticleOnStats extends StatefulWidget {
  // final void Function(Sponsor) onSponsorAdded;

  // AddSponsor({required this.onSponsorAdded});

  @override
  _AddArticleOnStatsState createState() => _AddArticleOnStatsState();
}

class _AddArticleOnStatsState extends State<AddArticleOnStats> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _typeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 370),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: AppColors.primaryWhite,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 24.0),
            child: Column(
              children: [
                DragBar(),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ADD ARTICLE TO SETUP', style: TextsStyles.spacedGray()),
                    IconButton(
                      icon: Icon(Icons.close),
                      color: AppColors.primaryGray30,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: Container(
                    height: 126,
                    width: 343,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.primaryGray5,
                        width: 1.0,
                      ),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/profile_page/icons/empty_image.png',
                          width: 100,
                        ),
                        Text('Add a photo')
                      ]
                    )
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _titleController,
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Title',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _typeController,
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Type',
                  ),
                ),
                SizedBox(height: 48.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Save',
                        style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack),
                      ),
                      style: ButtonStyles.articleElevatedButton(backgroundColor: AppColors.primaryGold60),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Delete',
                        style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack),
                      ),
                      style: ButtonStyles.articleOutlined(),
                    ),
                  ]
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
