import 'package:flutter/material.dart';
import 'package:travelling_app/models/trip.dart';
import '../widgets/trip_item.dart';

// الدخول الى نوع المكان
class CategoryTripsScreen extends StatefulWidget {
  // انشاء متغير يمكن استخدامه باي مكان
  static const screenRoute = '/category-trips';

  final List<Trip> avalibleTrips;
  CategoryTripsScreen(this.avalibleTrips);

  @override
  _CategoryTripsScreenState createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  String? categoryTitle;
  late List<Trip> displayTrips;
//الخاصة بالرحلات (id) المعتمدة على ال(id)  علشان بس تفوت هادي الصفحة تقوم بتحميل جميع ال
  @override
  void initState() {
    super.initState();
  }

// (context) تم استخدامها لكي يتم الحصول على
  @override
  void didChangeDependencies() {
    //   من الواجهة (arguments) استقبال ال
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryId = routeArgument['id'];
    categoryTitle = routeArgument['title'];
    //(app_data)هذا يؤشر على البيانات المتواجدة داخل ال
    displayTrips = widget.avalibleTrips.where((trip) {
      // (id)لعرض البيانات الخاصة بنوع الرحلة من خلال جلب
      return trip.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeTrip(String tripId) {
    setState(() {
      displayTrips.removeWhere((trip) => trip.id == tripId);
    });
  }

  // final String categoryId;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle!)),
      body: ListView.builder(
        itemCount: displayTrips.length,
        itemBuilder: (ctx, indext) {
          return TripItem(
            id: displayTrips[indext].id,
            title: displayTrips[indext].title,
            imageUrl: displayTrips[indext].imageUrl,
            duration: displayTrips[indext].duration,
            tripType: displayTrips[indext].tripType,
            season: displayTrips[indext].season,
            removeItem: _removeTrip,
          );
        },
      ),
    );
  }
}
