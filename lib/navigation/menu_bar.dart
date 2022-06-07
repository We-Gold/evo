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
        child: getContainer(MediaQuery.of(context).orientation)
      ),
    );
  }

  Widget getContainer(Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return Container(
        color: color,
        height: 35,
      );
    } else {
      return Container(
        color: color,
        width: 35,
      );
    }
  }
}
