import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../model/category_item.dart';
import '../../model/grocery_item.dart';
import '../../utils/custom_function.dart';
import '../../widgets/grocery_widgets/explore_items_widgets.dart';
import '../../widgets/grocery_widgets/explore_new_categories.dart';
import '../../widgets/grocery_widgets/explore_small_items_widget.dart';
import '../../widgets/grocery_widgets/grocery_banner_widget.dart';
import '../../widgets/grocery_widgets/grocery_item_card_widget.dart';
import '../../widgets/grocery_widgets/image_carousel_bottom_widget.dart';
import '../../widgets/grocery_widgets/image_carousel_widget.dart';
import '../../widgets/grocery_widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: HexColor("#49067f"),
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
        // NotificationListener is used to disable the scrolling colour
        body: NotificationListener<OverscrollIndicatorNotification>(
      onNotification:
          (OverscrollIndicatorNotification overscrollIndicatorNotification) {
        overscrollIndicatorNotification.disallowIndicator();
        return true;
      },
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            toolbarHeight: 50,
            floating: true,
            pinned: true,
            snap: false,
            elevation: 0,
            backgroundColor: HexColor("#49067f"),
            title: addressWidget(),
            actions: [actionsIconWidget(context)],
            bottom: SearchBarWidget(context),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const GroceryBannerWidget(),
                const SizedBox(
                  height: 10,
                ),
                ImageCarousel(),
                const SizedBox(
                  height: 15,
                ),
                padded(subTitle("Your Favourite Picks")),
                getFavouritePicks(myAppsItems),
                const SizedBox(
                  height: 25,
                ),
                padded(subTitle("Explore By Categories")),
                getExploreCategoryItems(context),
                getExploreCategorySmallItems(context),
                const SizedBox(
                  height: 25,
                ),
                padded(exploreNewCategoryTitle("Explore New Categories")),
                const SizedBox(
                  height: 25,
                ),
                ExploreNewCategories(),
                const SizedBox(
                  height: 25,
                ),
                padded(subTitle("Fresh & Healthy")),
                getFreshHealthy(myAppsItems, context),
                const SizedBox(
                  height: 20,
                ),
                ImageCarouselBottom(),
                const SizedBox(
                  height: 40,
                )
                // Add more list items as needed
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget padded(Widget widget) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15), child: widget);
  }

  Widget subTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        Text(
          "See All",
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: HexColor("#ed3e73")),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: Transform.rotate(
            angle: 180 * pi / 180,
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: HexColor("#ed3e73"),
              size: 11,
            ),
          ),
        ),
      ],
    );
  }

  Widget exploreNewCategoryTitle(String text) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
      ],
    );
  }

  Widget addressWidget() {
    return Row(children: [
      const Text(
        "Sevanthi Nagar",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Transform.rotate(
          angle: 270 * pi / 180,
          child: const Icon(
            Icons.arrow_back_ios_outlined,
            color: Colors.white,
            size: 13,
          ),
        ),
      ),
    ]);
  }

  Widget actionsIconWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Row(children: [
        SvgPicture.asset(
          "asset/icons/wallet_icon.svg",
          color: Colors.pinkAccent,
          width: 13,
          height: 17,
        ),
        const SizedBox(
          width: 5,
        ),
        IconButton(
          icon: const Icon(
            Icons.account_circle,
            color: Colors.white,
          ),
          onPressed: () {
            showCupertinoAlertLogoutDialog(context,'Are you sure you want to log out?');
          },
        ),
        // SvgPicture.asset("asset/icons/account_icon.svg",
        //     color: Colors.white, width: 13, height: 17,
        // ),
      ]),
    );
  }

  Widget getFavouritePicks(List<GroceryItem> items) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      height: 225,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: GroceryItemCardWidget(
              item: items[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 2,
          );
        },
      ),
    );
  }

  Widget getExploreCategoryItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: StaggeredGrid.count(
        crossAxisCount: 2,
        crossAxisSpacing: 11,
        children: exploreByCategoryItems.asMap().entries.map<Widget>((e) {
          ExploreByCategoryItem categoryItem = e.value;
          return GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 100,
              child: ExploreItems(item: categoryItem),
            ),
          );
        }).toList(), // add some space
      ),
    );
  }

  Widget getExploreCategorySmallItems(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        crossAxisSpacing: 11,
        mainAxisSpacing: 11,
        children: exploreByCategorySmallItems.asMap().entries.map<Widget>((e) {
          ExploreByCategoryItem categoryItem = e.value;
          return GestureDetector(
            onTap: () {},
            child: SizedBox(
              height: 95,
              child: ExploreSmallItems(item: categoryItem),
            ),
          );
        }).toList(), // add some space
      ),
    );
  }

  Widget getFreshHealthy(List<GroceryItem> items, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.green, HexColor("#00D025")],
        ),
        image: const DecorationImage(
            alignment: Alignment(-1, 2),
            image: AssetImage('images/fresh_healthy_banner.jpeg'),
            fit: BoxFit.contain),
      ),
      alignment: Alignment.bottomCenter,
      margin: const EdgeInsets.symmetric(vertical: 15),
      height: 235,
      child: ListView.separated(
        padding: const EdgeInsets.only(left: 145, right: 13),
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {},
            child: GroceryItemCardWidget(
              item: items[index],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 5,
          );
        },
      ),
    );
  }
}
