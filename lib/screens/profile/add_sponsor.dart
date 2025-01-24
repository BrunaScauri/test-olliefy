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

class AddSponsor extends StatefulWidget {
  // final void Function(Sponsor) onSponsorAdded;

  // AddSponsor({required this.onSponsorAdded});

  @override
  _AddSponsorState createState() => _AddSponsorState();
}

class _AddSponsorState extends State<AddSponsor> {
  final TextEditingController _sponsorNameController = TextEditingController();

  @override
  void dispose() {
    _sponsorNameController.dispose();
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
                    Text('ADD SPONSOR', style: TextsStyles.spacedGray()),
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
                  child: ProfilePicture(
                    borderWidth: 150.0,
                    borderHeight: 150.0,
                    imageWidth: 138.0,
                    imageHeight: 138.0,
                    imageHorizontalPadding: 6.0,
                    imageVerticalPadding: 6.0,
                    imagePath: 'assets/profile_page/icons/empty_profile_image_icon.png',
                  ),
                ),
                SizedBox(height: 48.0),
                TextFormField(
                  controller: _sponsorNameController,
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Sponsor name',
                  ),
                ),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Save',
                    style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack),
                  ),
                  style: ButtonStyles.elevatedButton(backgroundColor: AppColors.primaryGold60),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
