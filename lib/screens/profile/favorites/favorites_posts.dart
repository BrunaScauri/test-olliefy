import 'package:flutter/material.dart';
import 'package:test_olliefy/components/molecules/post_card_vertical.dart';

class FavoritesPosts extends StatefulWidget {
  @override
  _FavoritesPostsState createState() => _FavoritesPostsState();
}

class _FavoritesPostsState extends State<FavoritesPosts> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostCardVertical()
      ],
    );
  }
}

