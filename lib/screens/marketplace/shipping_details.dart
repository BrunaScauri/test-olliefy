import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/services.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/styles/fields.dart';

class ShippingDetails extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expirationDateController = TextEditingController();
  final TextEditingController _cvcController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 24.0),
          child: AppBar(),
        ),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 600.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: 170.0),
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: AppColors.primaryGold60,
                              image: DecorationImage(
                                image: AssetImage('assets/profile_page/example_store_items/1.jpeg'),
                                fit: BoxFit.cover,
                              )
                            ),
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(height: 16.0),
                          Text('20€', style: TextsStyles.blackSemiboldLarge()),
                          Text('DC Court Ssk New Sneakers', style: MarketplaceStyles.articleTitle()),
                        ],
                      ),
                    )
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 48),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('SHIPPING INFORMATION', style: TextsStyles.spacedGray()),
                        SizedBox(height: 24.0),
                        TextFormField(
                          controller: _fullNameController,
                          decoration: FormDecorations.textFieldDecoration(
                            labelText: 'Full Name',
                          ),
                        ),
                        SizedBox(height: 24.0),
                        TextFormField(
                          controller: _addressController,
                          decoration: FormDecorations.textFieldDecoration(
                            labelText: 'Address',
                          ),
                        ),
                        SizedBox(height: 48.0),
                        Text('CARD INFORMATION', style: TextsStyles.spacedGray()),
                        SizedBox(height: 24.0),
                        TextFormField(
                          controller: _cardNumberController,
                          onChanged: (value) {
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: <TextInputFormatter>[
                            FilteringTextInputFormatter.digitsOnly,
                            MaskTextInputFormatter(
                              mask: '#### #### #### ####',
                            )
                          ],
                          decoration: FormDecorations.textFieldDecoration(
                            labelText: 'Card number',
                            suffixIcon: Icons.email_outlined,
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _expirationDateController,
                                onChanged: (value) {},
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  MaskTextInputFormatter(mask: '##/##'),
                                ],
                                decoration: FormDecorations.textFieldDecoration(
                                  labelText: 'Expiration date',
                                ),
                              ),
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: TextFormField(
                                controller: _cvcController,
                                onChanged: (value) {},
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  FilteringTextInputFormatter.digitsOnly,
                                  MaskTextInputFormatter(mask: '###'),
                                ],
                                decoration: FormDecorations.textFieldDecoration(
                                  labelText: 'CVC',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]
                    )
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                          },
                          style: ButtonStyles.elevatedButton(
                          backgroundColor: AppColors.primaryGold60),
                          child: Text('Buy', style: TextStyles.elevatedButtonText(color: AppColors.primaryBlack),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16.0),
                ]
              )
            )
          ]
        )
      )
    );
  }
}