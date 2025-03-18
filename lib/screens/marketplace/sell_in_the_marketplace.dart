import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';

class SellInTheMarketplace extends StatefulWidget {
	@override
	_SellInTheMarketplaceState createState() => _SellInTheMarketplaceState();
}

class _SellInTheMarketplaceState extends State<SellInTheMarketplace> {
	@override
	Widget build(BuildContext context) {
		return Scaffold(
			backgroundColor: AppColors.primaryWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: AppBar(
            title: Text('Sell in marketplace', style: TextsStyles.profileDataBold()),
            backgroundColor: AppColors.primaryWhite,
          ),
        ),
      ),
			body: Center(
				child: Container(
          constraints: BoxConstraints(maxWidth: 370),
          child:Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              children: [
              ]
            )
          )
			  ),
      ),
    );
	}
}