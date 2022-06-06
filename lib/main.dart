import 'package:evo/navigation/menu_bar.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evo!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AppPage(),
    );
  }
}

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => AppPageState();
}

enum Pages { game, configuration }

class AppPageState extends State<AppPage> {
  Pages currentPage = Pages.game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MenuBar(color: AppColors.theme1),
          MenuBar(color: AppColors.theme2),
          MenuBar(color: AppColors.theme3),
          Expanded(child: Container(color: AppColors.theme4)),
        ],
      ),
    );
  }
}
