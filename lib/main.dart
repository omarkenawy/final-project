import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tawselaa_app/screens/forgot_screen.dart';
import 'package:tawselaa_app/screens/login_page.dart';
import 'package:tawselaa_app/screens/verify_screen.dart';



import 'screens/register_screen.dart';


void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter LoginPage',
      theme: ThemeData(
        textTheme:
        GoogleFonts.josefinSansTextTheme(Theme
            .of(context)
            .textTheme),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),

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
