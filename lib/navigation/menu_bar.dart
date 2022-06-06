import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  final Color color;

  const MenuBar({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 30,
    );
  }
}
