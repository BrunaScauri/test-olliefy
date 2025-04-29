import 'package:flutter/material.dart';

import 'package:test_olliefy/utils/colors.dart';
import 'package:test_olliefy/utils/styles/texts.dart';

import 'package:test_olliefy/screens/app_tab.dart';
import 'package:test_olliefy/components/atoms/main_confirm_button.dart';
import 'package:test_olliefy/components/molecules/bottom_sheet_header.dart';
import 'package:test_olliefy/screens/map/map_screen.dart';

class ChooseASpotScreen extends StatefulWidget {
  const ChooseASpotScreen({super.key});

  @override
  State<ChooseASpotScreen> createState() => _ChooseASpotScreenState();
}

class _ChooseASpotScreenState extends State<ChooseASpotScreen> {
  bool _isModalSheetOpen = false;
  late FocusNode _searchFocusNode;
  late TextEditingController _searchController;

  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _isModalSheetOpen = true;
        _openSheet();
      });
    });
  }

  @override
  void dispose() {
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _openSheet() {
    String? _selectedOption = '';
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return Wrap(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16, right: 16, bottom: 8),
                    child: Column(
                      children: [
                        BottomSheetHeader(title: 'SPOT'),
                        SizedBox(height: 16),
                        TextFormField(
                          focusNode: _searchFocusNode,
                          controller: _searchController,
                          onTap: () {
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, color: Colors.grey),
                            suffixIcon: (_searchController.text.isNotEmpty)
                              ? IconButton(
                                  icon: Image.asset('assets/map_page/icons/go_search_icon.png'),
                                  onPressed: () {
                                  },
                                )
                              : null,
                            hintText: 'Fix: Placeholder text',
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
                          },
                        ),
                        SizedBox(height: 32),
                        Row(
                          children: [
                            Text('CONDITION', style: TextsStyles.spacedGray()),
                          ],
                        ),
                        SizedBox(height: 24),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'regular',
                                    groupValue: _selectedOption,
                                    onChanged: (v) => setState(() => _selectedOption = v),
                                  ),
                                  SizedBox(width: 20),
                                  Text('Regular', style: ChallengesStyles.joinTheChallengeText()),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 30),
                              child: Row(
                                children: [
                                  Radio<String>(
                                    value: 'good',
                                    groupValue: _selectedOption,
                                    onChanged: (v) => setState(() => _selectedOption = v),
                                  ),
                                  SizedBox(width: 20),
                                  Text('Good', style: ChallengesStyles.joinTheChallengeText()),
                                ],
                              )
                            ),
                          ],
                        ),
                        SizedBox(height: 32),
                        MainConfirmButton(title: 'Confirm', onTap: () => {Navigator.pop(context)}, minimumSize: Size(MediaQuery.of(context).size.width, 60)),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }
        );
      },
      ).whenComplete(() {
        setState(() {
          _isModalSheetOpen = false;
        });
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.primaryWhite,
      appBar: AppBar(
        leadingWidth: 40.0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => AppTab(initialIndex: 2),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: AppColors.primaryBlack
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 262,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.primaryBlack,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('You can adjust your position on the map.', style: FeedStyles.videoDate())
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ],
          ),
          MapScreen(),
        ]
      ),
    );
  }
}