import 'package:flutter/material.dart';
import 'package:travelling_app/models/trip.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Trip> favoriteTrip;

  FavoritesScreen(this.favoriteTrip);
  //const FavoritesScreen({required Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('  ليس لديك أي رحلة في قائمة المفضلة'),
    );
  }
}
