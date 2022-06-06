import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget {
  final Color color;
  final Function onclick;

  const MenuBar({Key? key, required this.color, required this.onclick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => onclick(),
        child: Container(
          color: color,
          height: 35,
        ),
      ),
    );
  }
}
