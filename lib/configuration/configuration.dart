import 'package:evo/navigation/menu_bar.dart';
import 'package:evo/navigation/pages_model.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Configuration extends StatelessWidget {
  const Configuration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final configurationWidget = Expanded(child: Container(color: AppColors.theme4));

    return Consumer<PagesModel>(builder: (context, pages, child) {
      return Visibility(
          visible: pages.currentPage == Pages.configuration,
          replacement: MenuBar(
              color: AppColors.theme4, onclick: () => pages.navigateToConfiguration()),
          child: configurationWidget);
    });
  }
}
