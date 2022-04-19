import 'package:flutter/material.dart';

// الدخول الى نوع المكان
class CategoryTripsScreen extends StatelessWidget {
  final String categoryId;
  final String categoryTitle;

  CategoryTripsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: Center(child: Text('قائمة برحلات هذا التصنيف ')),
    );
  }
}
