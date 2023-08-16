import 'package:myprojects/model/user.dart';
import 'package:myprojects/model/navigation_item.dart';
import 'package:myprojects/provider/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavigationDrawerWidget extends StatelessWidget {
  static final padding = EdgeInsets.symmetric(horizontal: 20);

  //Padding for container under Tasks
  const NavigationDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: Container(
          // color: Color.fromRGBO(50, 55, 205, 1),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.purple],
            ),
          ),

          child: Column(
            children: <Widget>[
              buildHeader(
                context,
                urlImage: urlImage,
                name: name,
                email: email,
              ),
              const Divider(thickness: 1, color: Colors.black),
              Container(
                padding: padding,
                child: Column(
                  children: [
                    const SizedBox(height: 24),
                    buildMenuItem(
                      context,
                      item: NavigationItem.calculatorTask,
                      text: 'Calculator Task',
                      icon: Icons.calculate_sharp,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.imageTask,
                      text: 'Image Task',
                      icon: Icons.image_outlined,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(
                      context,
                      item: NavigationItem.editTask,
                      text: 'Edit Task',
                      icon: Icons.edit_note_outlined,
                    ),
                    const SizedBox(height: 16),
                    buildMenuItem(context,
                        item: NavigationItem.listViewTask,
                        text: 'Contact List Task',
                        icon: Icons.contacts_outlined),
                    const SizedBox(height: 16),
                    buildMenuItem(context,
                        item: NavigationItem.gridListViewTask,
                        text: 'Grid List Task',
                        icon: Icons.grid_4x4_rounded),
                    const SizedBox(height: 16),
                    buildMenuItem(context,
                        item: NavigationItem.youTubeTask,
                        text: 'YouTube Task',
                        icon: Icons.play_circle_outline_outlined),
                    const Divider(thickness: 1, color: Colors.black),
                    // const SizedBox(height: 16),
                    // buildMenuItem(
                    //   context,
                    //   item: NavigationItem.updates,
                    //   text: 'Updates',
                    //   icon: Icons.update,
                    // ),
                    // const SizedBox(height: 24),
                    // const Divider(color: Colors.white70),
                    // const SizedBox(height: 24),
                    // buildMenuItem(
                    //   context,
                    //   item: NavigationItem.plugins,
                    //   text: 'Plugins',
                    //   icon: Icons.account_tree_outlined,
                    // ),
                    // const SizedBox(height: 16),
                    // buildMenuItem(
                    //   context,
                    //   item: NavigationItem.notifications,
                    //   text: 'Notifications',
                    //   icon: Icons.notifications_outlined,
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );

//customize the build menu item for list tile
  Widget buildMenuItem(
    BuildContext context, {
    required NavigationItem item,
    required String text,
    required IconData icon,
  }) {
    final provider = Provider.of<NavigationProvider>(context);
    final currentItem = provider.navigationItem;
    final isSelected = item == currentItem;
    //if condition
    final color = isSelected ? Colors.orangeAccent : Colors.white;

    return Material(
      color: Colors.transparent,
      child: ListTile(
        selected: isSelected,
        selectedTileColor: Colors.white24,
        leading: Icon(icon, color: color),
        title: Text(text, style: TextStyle(color: color, fontSize: 16)),
        onTap: () => selectItem(context, item),
      ),
    );
  }

  //set listen false is used to navigate the items
  void selectItem(BuildContext context, NavigationItem item) {
    final provider = Provider.of<NavigationProvider>(context, listen: false);
    provider.setNavigationItem(item);
  }

  Widget buildHeader(
    BuildContext context, {
    required String urlImage,
    required String name,
    required String email,
  }) =>
      Material(
        color: Colors.transparent,
        child: InkWell(
          // Inkwell widget is used to gesture touch event
          onTap: () => selectItem(context, NavigationItem.calculatorTask),
          child: Container(
            padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
            child: Row(
              children: [
                // CircleAvatar(
                //     radius: 30, backgroundImage: NetworkImage(urlImage)),
                CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.blue,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                        radius: 15, backgroundImage: NetworkImage(urlImage)
                    ),
                  ),
                ),

                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                const Spacer(),
                const CircleAvatar(
                  radius: 24,
                  backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                  child: Icon(Icons.add_comment_outlined, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      );
}
