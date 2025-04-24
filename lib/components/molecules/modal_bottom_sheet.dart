import 'package:flutter/material.dart';

class ModalBottomSheet extends StatelessWidget {
  final Widget Function() onTap;
  final Widget child;

  const ModalBottomSheet({super.key, required this.onTap, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          context: context,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          ),
          builder: (BuildContext context) {
            return Wrap(
              children: [
                onTap(),
              ],
            );
          },
        );
      },
      child: child,
    );
  }
}