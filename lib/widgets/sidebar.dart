import 'package:flutter/material.dart';


class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      ListTile(
        leading: Icon(Icons.people),
        title: const Text('User'),
        onTap: () {

        },
      ),
      ListTile(
        leading: Icon(Icons.food_bank),
        title: const Text('Food'),
        onTap: () {

        },
      ),
      ListTile(
        leading: Icon(Icons.local_drink),
        title: const Text('Drink'),
        onTap: () {
          // Update the state of the app.
          // ...
        },
      ),
    ],
  ),
);
  }
}