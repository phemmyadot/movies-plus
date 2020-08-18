import 'package:flutter/material.dart';
import 'package:moviesplus/utils/app_icons.dart';
import 'package:moviesplus/utils/essentials.dart';

class AppMenu extends StatelessWidget {
  final title;


  AppMenu(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(vertical: 20),
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          title,
          style: AppTextStyles.headline2White
        ),
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            AppIcons.menu,
            color: AppColors.offWhite,
            size: 16,
          ),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
        // actions: [
          // IconButton(
          //   icon: Icon(
          //     AppIcons.search,
          //     color: AppColors.offWhite4,
          //     size: 16,
          //   ),
          //   onPressed: null,
          //   color: AppColors.offWhite4,
          // ),
        //   IconButton(
        //     icon: Icon(
        //       Icons.notifications_none,
        //       color: AppColors.offWhite4,
        //       size: 18,
        //     ),
        //     onPressed: null,
        //   ),
        // ],
      ),
    );
  }
}
