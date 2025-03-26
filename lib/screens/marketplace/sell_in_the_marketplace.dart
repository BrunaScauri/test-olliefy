import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/fields.dart';
import 'package:test_olliefy/utils/route/page_slide_animation.dart';

import 'package:test_olliefy/screens/marketplace/example_selected_photos.dart';
import 'package:test_olliefy/screens/marketplace/example_article_page.dart';

class SellInTheMarketplace extends StatefulWidget {
	@override
	_SellInTheMarketplaceState createState() => _SellInTheMarketplaceState();
}

class _SellInTheMarketplaceState extends State<SellInTheMarketplace> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  bool get _areFieldsFilled =>
    _titleController.text.isNotEmpty &&
    _priceController.text.isNotEmpty &&
    _descriptionController.text.isNotEmpty;

  @override
  void dispose() {
    _titleController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

	@override
	Widget build(BuildContext context) {
		return Scaffold(
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
          constraints: BoxConstraints(maxWidth: 380),
          child:Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Column(
              children: [
                SelectedPhotosRow(),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _titleController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Title',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _priceController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Price',
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _descriptionController,
                  onChanged: (value) {
                    setState(() {});
                  },
                  decoration: FormDecorations.textFieldDecoration(
                    labelText: 'Description',
                  ),
                ),
                SizedBox(height: 48.0),
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      child: ElevatedButton(
                        onPressed: _areFieldsFilled ? () {
                          Navigator.of(context).push(
                            pageSlideAnimation(ExampleArticlePage())
                          );
                        } : null,
                        style: ButtonStyles.elevatedButton(backgroundColor: _areFieldsFilled ? AppColors.primaryGold60 : AppColors.primaryGray10),
                        child: Text(
                          'Post Article',
                          style: _areFieldsFilled ? TextStyles.elevatedButtonText(color: AppColors.primaryBlack) : TextStyles.elevatedButtonText(color: AppColors.primaryGray10),
                        ),
                      ),
                    )
                  ),
                ),
              ]
            )
          )
			  ),
      ),
    );
	}
}