import 'package:flutter/material.dart';
import '../screens/category_trips_screen.dart';

//  العنصر الواحد في شاشة الكاتيغوري
class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;

  const CategoryItem(this.id, this.title, this.imageUrl);

  // للانتقال الى صفحة جديدة
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoryTripsScreen.screenRoute, arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // تم استخدامها لاظهار أكثر من طبقة فوق بعض
    // InkWell تستخدم للضغط على كل كنصر الى هو المربع
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        children: [
          // fit: BoxFit.cover  تستخدم تغطية مساحة التي موجودة فيها
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(imageUrl, height: 250, fit: BoxFit.cover)),

          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.black.withOpacity(0.4),
            ),
          )
        ],
      ),
    );
  }
}
