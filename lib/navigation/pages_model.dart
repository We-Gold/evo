import 'package:flutter/material.dart';

enum Pages { game, configuration }

class PagesModel extends ChangeNotifier {
  Pages _currentPage = Pages.configuration;

  Pages get currentPage => _currentPage;

  void navigateToGame() {
    _currentPage = Pages.game;

    notifyListeners();
  }

  void navigateToConfiguration() {
    _currentPage = Pages.configuration;

    notifyListeners();
  }
}
