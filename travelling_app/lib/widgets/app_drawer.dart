import 'package:flutter/material.dart';
import '../screens/categories_screen.dart';
import '../screens/category_trips_screen.dart';
import '../screens/filter_screen.dart';
import 'package:travelling_app/app_data.dart';

import 'category_item.dart';
//import '../screens/filters_screen.dart';

class AppDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function() onTapLink) {
    return ListTile(
      onTap: onTapLink,
      leading: Icon(
        icon,
        size: 30,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'ElMessiri',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: [
        Container(
          height: 100,
          width: double.infinity,
          padding: EdgeInsets.only(top: 40),
          alignment: Alignment.center,
          color: Theme.of(context).accentColor,
          child: Text(
            'دليلك السياحي ',
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        buildListTile('الرحلات ', Icons.card_travel, () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CategoriesScreen()));
        }),
        buildListTile('الفلترة', Icons.filter_list, () {
          Navigator.of(context).pushReplacementNamed(FilterScreen.screenRoute);
        })
      ]),
    );
  }
}
