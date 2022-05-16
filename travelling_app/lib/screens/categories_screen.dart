import 'package:flutter/material.dart';
import 'package:travelling_app/widgets/app_drawer.dart';

// التحكم ب كامل الشاشة

import '../app_data.dart';
import '../widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        drawer: AppDrawer(),
        appBar: AppBar(title: Text("الرحلات ")),
        body: GridView(
          padding: EdgeInsets.all(10),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              //  عدد الاعمدة التي سيتم عرضها
              maxCrossAxisExtent: 200,
              // عرض و ارتفاع العنصر ب شكل نسبة و تناسب
              childAspectRatio: 7 / 8,
              // المسافة بين العناصر بشكل أفقي
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          //Cartegories_data المتواجدة في ملف ال (app_adata)
          children: Cartegories_data.map((categoryData) => CategoryItem(
                categoryData.id,
                categoryData.title,
                categoryData.imageUrl,
              )).toList(),
        ));
  }
}
