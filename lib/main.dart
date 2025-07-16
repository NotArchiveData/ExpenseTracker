import 'package:expensetracker/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// gsheets
import 'package:gsheets/gsheets.dart';
import 'package:expensetracker/gsheets_api.dart';

void main() async {  
  // initialise hive & open box
  await Hive.initFlutter();
  var box1 = await Hive.openBox("+");
  var box2 = await Hive.openBox("-");

  // initialise google sheets
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSheetsApi.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "SF-Pro",

        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.white24,
          selectionHandleColor: Colors.white,
        ),
      ),
      home: LandingPage(),
    );
  }
}

