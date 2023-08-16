import 'package:flutter/material.dart';

import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../explore/explore_screen.dart';
import '../favourite/favourite_screen.dart';
import '../home/home_screen.dart';


class NavigatorItem {
  final String label;
  final String iconPath;
  final int index;
  final Widget screen;

  NavigatorItem(this.label, this.iconPath, this.index, this.screen);
}

List<NavigatorItem> navigatorItems = [
  NavigatorItem("Shop", "asset/icons/shop_icon.svg", 0,  HomeScreen()),
  NavigatorItem("Explore", "asset/icons/explore_icon.svg", 1, ExploreScreen()),
  NavigatorItem("Cart", "asset/icons/cart_icon.svg", 2, CartScreen()),
  NavigatorItem(
      "Favourite", "asset/icons/favourite_icon.svg", 3, FavouriteScreen()),
  NavigatorItem("Account", "asset/icons/account_icon.svg", 4, AccountScreen()),
];
