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
        // backgroundColor: Colors.grey[200],
        // indicatorColor: Colors.amber[800],
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(icon: Icon(Icons.home,), label: 'Home',),
          NavigationDestination(icon: Icon(Icons.search), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.add_circle), label: 'Compose'),
          NavigationDestination(icon: Icon(Icons.send), label: 'Share'),
          NavigationDestination(icon: Icon(Icons.inventory), label: 'Library'),
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
