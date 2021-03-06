import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travelling_app/providers/auth_provider.dart';
import 'package:travelling_app/widgets/login_screen.dart';
import 'package:travelling_app/widgets/splash_screen.dart';
import './app_data.dart';
import 'package:travelling_app/screens/categories_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:travelling_app/screens/category_trips_screen.dart';
import 'package:travelling_app/screens/filter_screen.dart';
import 'package:travelling_app/screens/tabs_screen.dart';
import 'package:travelling_app/screens/trip_detail_screen.dart';
import './screens/category_trips_screen.dart';
import './screens/trip_detail_screen.dart';
import './models/trip.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //Firebase.initializeApp();
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(ChangeNotifierProvider<AuthProvider>(
    create: (context) => AuthProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'summer': false,
    'winter': false,
    'family': false,
  };
  List<Trip> _availableTrips = Trips_data;
  // لاضافة الصفحات المفضلة لدي المستخدم
  List<Trip> _favoriteTrips = [];

  void _changeFilter(Map<String, bool> filterData) {
    setState(() {
      //تعين قيم جديدة على حسب الفلتر الذي تم اختياره
      _filters = filterData;
//  لعمل فلترة للبيانات المتواجدة لدي على حسب الفلتر الذي أقوم باختياره
      _availableTrips = Trips_data.where((trip) {
        //اذا كان في ملف (المودلز) رحلات الصيفية فولس لن تظهر الرحلات من هذا النوع و الباقي  يظهر و هكذا للباقي
        if (_filters['summer'] == true && trip.isInSummer != true) {
          return false;
        }
        if (_filters['winter'] == true && trip.isInWinter != true) {
          return false;
        }
        if (_filters['family'] == true && trip.isForFamilies != true) {
          return false;
        }
        // ستظهر جميع الرحلات في حال لم يتم اختيار الفلترة
        return true;
      }).toList();
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //  home: CategoriesScreen(),
      initialRoute: 'init_screen',
      routes: {
        'init_screen': (ctx) => FirebaseConfiguration(),
        '/': (ctx) => TabScreen(),
        '/Login-trips': (context) => LoginScreen(),
        CategoryTripsScreen.screenRoute: (ctx) =>
            CategoryTripsScreen(_availableTrips),
        TripDetailScreen.screenRoute: (ctx) => TripDetailScreen(),
        FilterScreen.screenRoute: (ctx) => FilterScreen(_filters, _changeFilter)
      },
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // Arabic, no country code
      ],
      title: 'Travel App',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          fontFamily: 'ElMessiri',
          textTheme: ThemeData.light().textTheme.copyWith(
              headline5: TextStyle(
                  color: Colors.blue,
                  fontSize: 24,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold))),
    );
  }
}

class FirebaseConfiguration extends StatelessWidget {
  static String routeName = 'firebaseConfiguration';
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, AsyncSnapshot<FirebaseApp> dataSnappshot) {
          if (dataSnappshot.hasError) {
            return Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: ElevatedButton(
                  child: Text(dataSnappshot.error.toString()),
                  onPressed: () {
                    print(dataSnappshot.error.toString());
                  },
                ),
              ),
            );
          }
          if (dataSnappshot.connectionState == ConnectionState.done) {
            // return Scaffold(
            //   body: Text('DONE'),
            // );
            return SplashSceen();
          }
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        });
  }
}
