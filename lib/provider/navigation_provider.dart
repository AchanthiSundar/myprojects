import 'package:flutter/material.dart';
import 'package:myprojects/model/navigation_item.dart';

class NavigationProvider extends ChangeNotifier {
  //default show in dashboard is calculator task and show default in drawer
  NavigationItem _navigationItem = NavigationItem.calculatorTask;

  NavigationItem get navigationItem => _navigationItem;

  void setNavigationItem(NavigationItem navigationItem) {
    _navigationItem = navigationItem;

    notifyListeners();
  }
}
