import 'package:news/ui/utils/app_colors.dart';
import 'package:news/ui/utils/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:news/ui/drawer/section_drawer_item.dart';
import 'package:news/ui/utils/app_styles.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          color: AppColors.whiteColor,
          padding: EdgeInsets.only(
            top: height * 0.075,
          ),
          height: height * 0.16,
          width: double.infinity,
          child: Text(
            'News App',
            style: AppStyles.bold24Black,
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: (){

          },
          child: SectionDrawerItem(
              imagePath: AssetsManager.homeIcon, text: 'Go To Home'),
        ),
        Divider(
          color: AppColors.whiteColor,
          indent: width * 0.03,
          endIndent: width * 0.03,
          thickness: 2,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: (){

          },
          child: SectionDrawerItem(
            imagePath: AssetsManager.themeIcon,
            text: 'Theme',
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.04),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Dark',
                style: AppStyles.medium20White,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.whiteColor,
                size: 30,
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.whiteColor,
          indent: width * 0.03,
          endIndent: width * 0.03,
          thickness: 2,
        ),
        SizedBox(
          height: height * 0.02,
        ),
        InkWell(
          onTap: (){

          },
          child: SectionDrawerItem(
              imagePath: AssetsManager.languageIcon, text: 'Language'),
        ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * 0.02),
          padding: EdgeInsets.symmetric(
              vertical: height * 0.02, horizontal: width * 0.04),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.whiteColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'English',
                style: AppStyles.medium20White,
              ),
              Icon(
                Icons.arrow_drop_down,
                color: AppColors.whiteColor,
                size: 30,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
