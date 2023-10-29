// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:muve_application/routes.dart' as routes;

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key, required this.body});
  final Widget body;

  @override
  State<StatefulWidget> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      switch (_selectedIndex) {
        case 0:
          context.go(routes.homePath);
          break;
        case 1:
          context.go(routes.explorePath);
        case 2:
          context.go(routes.createPath);
        case 3:
          context.go(routes.sharePath);
        case 4:
          context.go(routes.libraryPath);
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Muve'),
      // ),
      body: widget.body,
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blueGrey,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: 'Create',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.send),
            label: 'Share',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory),
            label: 'Library',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
