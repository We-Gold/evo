import 'package:evo/configuration/configuration.dart';
import 'package:evo/game/game_widget.dart';
import 'package:evo/navigation/menu_bar.dart';
import 'package:evo/navigation/pages_model.dart';
import 'package:evo/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => PagesModel(), child: const App()));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evo!',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        textTheme: GoogleFonts.zillaSlabTextTheme(),
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

class AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MenuBar(color: AppColors.theme1, onclick: () => {}),
          MenuBar(color: AppColors.theme2, onclick: () => {}),
          const Game(),
          const Configuration(),
        ],
      ),
    );
  }
}
