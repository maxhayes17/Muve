import 'package:flutter/material.dart';
import 'package:muve_application/views/compose_page.dart';
import 'package:muve_application/views/explore_page.dart';
import 'package:muve_application/views/home_page.dart';
import 'package:muve_application/views/library_page.dart';
import 'package:muve_application/views/share_page.dart';

class NavScaffold extends StatefulWidget {
  final int index;

  const NavScaffold({super.key, required this.index});

  @override
  State<NavScaffold> createState() => _NavScaffoldState();
}

class _NavScaffoldState extends State<NavScaffold> {
  late int currentPageIndex;

  @override
  void initState() {
    super.initState();
    currentPageIndex = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        // backgroundColor: Colors.black,
        // backgroundColor: Colors.blueGrey[00],
        // indicatorColor: Colors.amber[800],
        // labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        indicatorColor: Colors.amber[800],
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.black,),
            icon: Icon(Icons.home, color: Colors.white,), 
            label: 'Home',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.search, color: Colors.black,),
            icon: Icon(Icons.search, color: Colors.white,), 
            label: 'Explore'
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.add_circle, color: Colors.black,),
            icon: Icon(Icons.add_circle, color: Colors.white,), 
            label: 'Compose'
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.send, color: Colors.black,),
            icon: Icon(Icons.send, color: Colors.white,),  
            label: 'Share'
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.inventory, color: Colors.black,),
            icon: Icon(Icons.inventory, color: Colors.white,),  
            label: 'Library',
          ),
        ],
      ),
      body: <Widget>[
        const HomePage(),
        const ExplorePage(),
        const ComposePage(),
        const SharePage(),
        const LibraryPage(),
      ][currentPageIndex],
    );
  }
}
