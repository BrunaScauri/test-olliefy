import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_olliefy/utils/colors.dart';

import 'package:test_olliefy/modal/user_modal.dart';
import 'package:test_olliefy/components/molecules/permissions_card.dart';


class Permissions extends StatefulWidget {
  @override
  _PermissionsState createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserModal>(
      create: (context) => UserModal(),
      child: Scaffold(
        body: Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: 370),
            child: Consumer<UserModal>(
              builder: (context, modal, child) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 40.0),
                        child: Image.asset('assets/permissions_page/permissions_page_hero.png', height: 160),
                      ),
                      Container(
                          child: RichText(
                            text:TextSpan(style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryBlack), children: [
                              TextSpan(text:'For a more fun experience, we need to activate some permissions.'),
                            ])
                          )
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40.0),
                        child: Column(
                          children: [
                            PermissionsCard(imagePath: 'assets/permissions_page/icons/location_icon.svg', permissionName: 'Location'),
                            SizedBox(height: 18),
                            PermissionsCard(imagePath: 'assets/permissions_page/icons/camera_icon.svg', permissionName: 'Camera'),
                            SizedBox(height: 16),
                            PermissionsCard(imagePath: 'assets/permissions_page/icons/photo_gallery_icon.svg', permissionName: 'Photo gallery'),
                            SizedBox(height: 16),
                            PermissionsCard(imagePath: 'assets/permissions_page/icons/contacts_icon.svg', permissionName: 'Contacts'),
                            SizedBox(height: 16),
                          ]
                        )
                      )
                    ]
                  )
                );
              },
            )
          )
        )
      )
    );
  }
}