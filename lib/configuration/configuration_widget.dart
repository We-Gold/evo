import 'package:evo/configuration/configuration.dart';
import 'package:evo/navigation/menu_bar.dart';
import 'package:evo/navigation/pages_model.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Configuration extends StatefulWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ConfigurationState();
}

class ConfigurationState extends State<Configuration> {
  final configurationWidget = Expanded(
      child: GameWidget(
    game: ConfigurationGame(),
    mouseCursor: SystemMouseCursors.basic,
  ));

  @override
  Widget build(BuildContext context) {
    return Consumer<PagesModel>(builder: (context, pages, child) {
      return Visibility(
        visible: pages.currentPage == Pages.configuration,
        replacement: MenuBar(
            color: AppColors.theme4,
            onclick: () => pages.navigateToConfiguration()),
        child: configurationWidget,
      );
    });
  }
}
