import 'package:flutter/material.dart';
import 'package:travelling_app/screens/categories_screen.dart';
import 'package:travelling_app/screens/favorites_screen.dart';

import '../widgets/app_drawer.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
//سيتم تنفيذ هذه الدالة ( BottomNavigationBarItem)عند الضغط على
  void _selectScreen(int indext) {
    setState(() {
      _selectedScreenIndex = indext;
    });
  }

  int _selectedScreenIndex = 0;
  final List<Widget> _screens = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دليل سياحي '),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: _screens[_selectedScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'التصنيفات '),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'المفضلة  '),
        ],
      ),
    );
  }
}
