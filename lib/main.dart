import 'package:expensetracker/colours.dart';
import 'package:expensetracker/landingpage.dart';
import 'package:flutter/material.dart';
import 'package:expensetracker/gsheets_api.dart';
import 'package:flutter/services.dart';

void main() async {  
  // initialise google sheets
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSheetsApi.init();

  // setting status bar colour and icon colour along with bottom navigation bar
  WidgetsBinding.instance.addPostFrameCallback((_) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: mainBg,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,

      systemNavigationBarColor: mainBg
    ));
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        progressIndicatorTheme: ProgressIndicatorThemeData(color: Colors.white),
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
