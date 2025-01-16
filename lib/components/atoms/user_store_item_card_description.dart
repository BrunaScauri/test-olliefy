import 'package:flutter/material.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

class UserStoreItemCardDescription extends StatelessWidget {
  final String? itemPrice;
  final String? itemName;
  final String? itemType;
  final String? itemCondition;

  const UserStoreItemCardDescription({
    Key? key,
    this.itemPrice,
    this.itemName,
    this.itemType,
    this.itemCondition,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (itemPrice != null)
            Text(
              itemPrice!,
              style: UserStoreStyles.itemPrice(),
            ),
          if (itemName != null)
            Text(
              itemName!,
              style: UserStoreStyles.itemDescription(),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          if (itemType != null)
            Text(
              itemType!,
              style: UserStoreStyles.itemDescription(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ]
      )
    );
  }
}
