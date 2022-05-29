
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:tawselaa_app/screens/forgot_screen.dart';
import 'package:tawselaa_app/screens/home_page.dart';
import 'package:tawselaa_app/screens/login_page.dart';
import 'package:tawselaa_app/screens/map_screen.dart';
import 'screens/register_screen.dart';
import 'package:http/http.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// @dart=2.9

 Future<void> main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //title: 'Flutter LoginPage',
      home:MapScreen(),

    );








       // builder: (Buildcontext,snapshot) {
         // if (snapshot.hasError) {
           // print('You have an error! ${snapshot.error.toString()}');
          //  return Text('Something went wrong');
        //  } else if (snapshot.hasData) {
           // return VerifyScreen();
        //  }
         // },
     // )

  }
  }
