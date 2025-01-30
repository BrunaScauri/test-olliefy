import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/modal/user_modal.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';

class PermissionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Container(
        color: AppColors.primaryWhite,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16),
            Icon(Icons.location_on_outlined, color: Colors.teal, size: 30),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: RichText(
                text: TextSpan(
                  style: TextStyles.primaryHeader(),
                  children: [
                    TextSpan(text: "Allow ", style: TextsStyles.permissionText()),
                    TextSpan(text: "Olliefy", style: TextsStyles.permissionBoldText()),
                    TextSpan(text: " to access this device’s location?", style: TextsStyles.permissionText()),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Divider(height: 1),
            buildDialogButton(context, "WHILE USING THE APP"),
            Divider(height: 1),
            buildDialogButton(context, "ONLY THIS TIME"),
            Divider(height: 1),
            buildDialogButton(context, "DON'T ALLOW"),
          ],
        ),
      ),
    );
  }

Widget buildDialogButton(BuildContext context, String text) {
    return Consumer<UserModal>(
      builder: (context, userModal, child) {
        return InkWell(
          onTap: () {
            userModal.restartEvaluating();
            userModal.incrementStep(context);
            Navigator.pop(context);
          },
          child: Container(
            color: AppColors.primaryWhite,
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            width: double.infinity,
            child: Text(
              text,
              style: TextsStyles.permissionButton(),
            ),
          ),
        );
      },
    );
  }
}