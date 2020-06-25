import 'package:flutter/material.dart';
import 'package:userdef_climaApp/Screens/city_screen.dart';
import 'package:userdef_climaApp/Screens/loading_screen.dart';
import 'package:userdef_climaApp/Screens/location_screen.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
