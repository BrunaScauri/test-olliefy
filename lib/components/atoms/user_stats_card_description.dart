import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class UserStatsCardDescription extends StatelessWidget {
  final String? itemName;
  final String? itemType;

  const UserStatsCardDescription({
    Key? key,
    this.itemName,
    this.itemType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (itemName != null)
            Text(
              itemName!,
              style: UserStoreStyles.itemPrice(),
            ),
          if (itemType != null)
            Text(
              itemType!,
              style: UserStoreStyles.itemDescription(),
            ),
        ]
      )
    );
  }
}
