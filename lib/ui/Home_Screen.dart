import 'package:flutter/material.dart';
import 'package:news/ui/category/category_details.dart';
import 'package:news/ui/drawer/home_drawer.dart';
import 'package:news/ui/utils/app_colors.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home',style: Theme.of(context).textTheme.headlineLarge,),
      ),
      drawer:  const Drawer(
        backgroundColor: AppColors.blackColor,
        child: HomeDrawer(),
      ),
      body: CategoryDetails(),
    );
  }
}
