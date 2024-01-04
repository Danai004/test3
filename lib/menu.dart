import 'package:csit2023/stakskeen.dart';
import 'package:flutter/material.dart';

class MainMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Menu'),
      ),
      body: GridView.count(
        crossAxisCount: 2, // 2 columns
        padding: EdgeInsets.all(16.0),
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 16.0,
        children: [
          MenuItem(
            title: 'Menu 1',
            onPressed: () {
              // Add functionality for Menu 1
            },
          ),
          MenuItem(
            title: 'Menu 2',
            onPressed: () {
              // Add functionality for Menu 2
            },
          ),
          MenuItem(
            title: 'Menu 3',
            onPressed: () {
              // Add functionality for Menu 3
            },
          ),
          MenuItem(
            title: 'Menu 4',
            onPressed: () {
              // Add functionality for Menu 4
            },
          ),
          MenuItem(
            title: 'Menu 5',
            onPressed: () {
              // Add functionality for Menu 5
            },
          ),
          MenuItem(
            title: 'Menu 6',
            onPressed: () {
              // Add functionality for Menu 6
            },
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const MenuItem({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: onPressed,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: MainMenu(),
    ),
  );
}