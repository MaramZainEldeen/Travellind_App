import 'package:flutter/material.dart';
import '../models/trip.dart';
import 'package:travelling_app/screens/categories_screen.dart';
import 'package:travelling_app/screens/favorites_screen.dart';

import '../widgets/app_drawer.dart';

class TabScreen extends StatefulWidget {
  //final List<Trip> favoriteTrips;
  //TabScreen(this.favoriteTrips);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
//سيتم تنفيذ هذه الدالة ( BottomNavigationBarItem)عند الضغط على
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  int _selectedScreenIndex = 0;

  late List<Map<String, Object>> _screens;

  @override
  void initState() {
    _screens = [
      {
        'Screen': CategoriesScreen(),
        'Title': 'تصنيفات الرحلات',
      },
      {
        //'Screen': FavoritesScreen(widget.favoriteTrips),
        'Title': 'الرحلات المفضلة',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('thanks'),
      ),
      drawer: AppDrawer(),
      body: Text('any'),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).accentColor,
        unselectedItemColor: Colors.white,
        currentIndex: _selectedScreenIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'التصنيفات',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'المفضلة',
          ),
        ],
      ),
    );
  }
}
