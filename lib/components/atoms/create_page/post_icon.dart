import 'package:flutter/material.dart';

class PostIcon extends StatefulWidget {
  const PostIcon({Key? key}) : super(key: key);

  @override
  State<PostIcon> createState() => _PostIconState();
}

class _PostIconState extends State<PostIcon> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
          },
          child: Container(
            height: 88,
            width: 88,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/create_page/icons/post_icon.png'
                ),
              ),
            ),
          ),
        ),
      ]
    );
  }
}