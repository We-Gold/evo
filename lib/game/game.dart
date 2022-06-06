import 'package:evo/navigation/menu_bar.dart';
import 'package:evo/navigation/pages_model.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Game extends StatelessWidget {
  const Game({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameWidget = Expanded(child: Container(color: AppColors.theme3));

    return Consumer<PagesModel>(builder: (context, pages, child) {
      return Visibility(
          visible: pages.currentPage == Pages.game,
          replacement: MenuBar(
              color: AppColors.theme3, onclick: () => pages.navigateToGame()),
          child: gameWidget);
    });
  }
}
