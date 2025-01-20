import 'package:flutter/material.dart';
import 'package:news/ui/Home_Screen.dart';
import 'package:news/ui/category/category_details.dart';
import 'package:news/ui/utils/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
     debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {HomeScreen.routeName : (context) => HomeScreen(),
      CategoryDetails.routeName : (context) => CategoryDetails(),
      },
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}

