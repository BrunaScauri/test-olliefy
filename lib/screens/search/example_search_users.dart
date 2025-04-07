import 'package:flutter/material.dart';

import 'package:test_olliefy/components/molecules/user_list.dart';

class ExampleSearchUsers extends StatefulWidget {
	@override
	_ExampleSearchUsersState createState() => _ExampleSearchUsersState();
}

class _ExampleSearchUsersState extends State<ExampleSearchUsers> {
  final List<Map<String, dynamic>> items = [
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/0.jpeg', 'profileName': 'sk8_legend'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/1.jpeg', 'profileName': 'pavementripper'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/2.jpeg', 'profileName': 'trickwizard'},
    {'imagePath': 'assets/profile_page/icons/example_pfp/3.jpeg', 'profileName': 'board_beast'},
  ];

	@override
Widget build(BuildContext context) {
  return Column(
    children: [
      ListView.separated(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return UserList(
            imagePath: item['imagePath'],
            profileName: item['profileName'],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 48),
      ),
    ],
  );
}
}

