import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';
import 'package:test_olliefy/utils/styles/buttons.dart';
import 'package:test_olliefy/utils/route/slide_incoming_from_bottom.dart';

import 'package:test_olliefy/components/atoms/drag_bar.dart'; 
import 'package:test_olliefy/components/molecules/markerplace_filter_button.dart';
import 'package:test_olliefy/screens/marketplace/sell_in_the_marketplace.dart';
import 'package:test_olliefy/screens/profile/favorites/favorites_marketplace.dart';

class Marketplace extends StatefulWidget {
  @override
  _MarketplaceState createState() => _MarketplaceState();
}

enum OptionType { radio, checkbox }

class _MarketplaceState extends State<Marketplace> {
  final TextEditingController _searchController = TextEditingController();

  String? _selectedSortBy;
  String? _selectedCondition;
  List<String> _selectedPrice = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showOptions(BuildContext context, String title, List<String> options, OptionType type, Function(dynamic selected) onSelected) {
    showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.primaryWhite,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
      builder: (context) {
        if (type == OptionType.radio) {
          String? selectedOption = options.first;
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: DragBar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: TextsStyles.spacedGray()),
                        IconButton(
                          icon: Icon(Icons.close),
                          color: AppColors.primaryGray30,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ]
                    ),
                  ),
                  ...options.map((option) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedOption = option;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(option),
                          Radio<String>(
                            value: option,
                            groupValue: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
                  //confirmation button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        onSelected(selectedOption);
                        Navigator.pop(context);
                      },
                      child: Text("Apply"),
                    ),
                  ),
                ],
              );
            },
          );
        } else if (type == OptionType.checkbox) {
          Map<String, bool> selectedOptions = {
            for (var option in options) option: false
          };
          return StatefulBuilder(
            builder: (context, setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: DragBar(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title, style: TextsStyles.spacedGray()),
                        IconButton(
                          icon: Icon(Icons.close),
                          color: AppColors.primaryGray30,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ]
                    ),
                  ),
                  ...options.map((option) => InkWell(
                    onTap: () {
                      setState(() {
                        selectedOptions[option] = !selectedOptions[option]!;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(option),
                          Checkbox(
                            value: selectedOptions[option],
                            onChanged: (bool? value) {
                              setState(() {
                                selectedOptions[option] = value ?? false;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
                  //confirmation button
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        final activeSelections = selectedOptions.entries
                            .where((entry) => entry.value)
                            .map((entry) => entry.key)
                            .toList();
                        onSelected(activeSelections);
                        Navigator.pop(context);
                      },
                      child: Text("Apply"),
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return Container();
        }
      },
    );
  }

  void _showMainBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.primaryWhite,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DragBar(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('FILTER', style: TextsStyles.spacedGray()),
                  IconButton(
                    icon: Icon(Icons.close),
                    color: AppColors.primaryGray30,
                    onPressed: () => Navigator.pop(context),
                  ),
                ]
              ),
              SizedBox(height: 24),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Sort by', style: TextsStyles.profileDataBold()),
                          if (_selectedSortBy != null)
                            Text(
                              _selectedSortBy!,
                              style: TextsStyles.profileDescription(),
                            ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showOptions(context, 'SORT BY', ['Popular', 'Newest', 'Highest price', 'Lowest price'], OptionType.radio, (selected) {
                      setState(() {
                        _selectedSortBy = selected;
                      });
                    });
                  },
                ),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Condition', style: TextsStyles.profileDataBold()),
                          if (_selectedCondition != null)
                            Text(
                              _selectedCondition!,
                              style: TextsStyles.profileDescription(),
                            ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showOptions(context, 'CONDITION', ['New', 'Used'], OptionType.radio, (selected) {
                      setState(() {
                        _selectedCondition = selected;
                      });
                    });
                  },
                ),
              ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Price', style: TextsStyles.profileDataBold()),
                          if (_selectedPrice.isNotEmpty)
                            Text(
                              _selectedPrice.join(', '),
                              style: TextsStyles.profileDescription(),
                            ),
                        ],
                      ),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    _showOptions(context, 'PRICE', ['1€ to 10€', '10€ to 20€', '20€ to 30€', '30€ to 50€'], OptionType.checkbox, (selected) {
                      setState(() {
                        _selectedPrice = selected;
                      });
                    });
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers:[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                        hintText: 'Search Articles',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(3.0),
                          borderSide: BorderSide(color: AppColors.primaryGold70),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primaryGold70, width: 3.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                      ),
                      onChanged: (value) {
                        print("Search query: $value");
                      },
                    ),
                  ),
                  SizedBox(width: 22),
                  IconButton(
                    icon: Image.asset('assets/map_page/icons/filter_icon.png', width: 18),
                    iconSize: 24,
                    onPressed: () {
                      _showMainBottomSheet(context);
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 24),
              child: MarketplaceFilterButtonRow(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 12),
              child: OutlinedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    SlideIncomingFromBottom(exitPage: Marketplace(), enterPage: SellInTheMarketplace())
                  );
                },
                style: ButtonStyles.marketplaceButton(),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: AppColors.primaryGray10,
                      size: 20,
                    ),
                    SizedBox(width: 4),
                    RichText(
                      text: TextSpan(
                        style: TextStyles.elevatedButtonText(color: AppColors.primaryGray10),
                        children: [
                          TextSpan(text: 'Sell in the marketplace'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: FavoritesMarketplace(),
            ),
          )
        ]
      ),
    );
  }
}