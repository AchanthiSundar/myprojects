import 'package:flutter/material.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const SearchBarWidget(BuildContext context, {super.key});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(3),
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(7))),
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 30,
          height: 35,
          child: TextField(
            cursorColor: Colors.grey,
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
                hintText: 'Search for over 5000 products',
                prefixIcon: Icon(Icons.search,color: Colors.grey,),
                border: InputBorder.none),
            onChanged: (value) {
              // Implement search functionality here
            },
          ),
        ),
      ),
    );
  }
}
