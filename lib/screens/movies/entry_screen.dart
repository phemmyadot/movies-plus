import 'package:flutter/material.dart';
import 'package:moviesplus/models/config_model.dart';
import 'package:moviesplus/screens/movies/movies_screen.dart';
import 'package:moviesplus/screens/movies/search_screen.dart';
import 'package:moviesplus/services/config_service.dart';
import 'package:moviesplus/utils/app_icons.dart';
import 'package:moviesplus/utils/essentials.dart';
import 'package:moviesplus/widgets/custom_drawer.dart';

class MoviesEntryScreen extends StatefulWidget {
  static const routeName = '/movies-entry';
  @override
  _MoviesEntryScreenState createState() => _MoviesEntryScreenState();
}

class _MoviesEntryScreenState extends State<MoviesEntryScreen> {
  int _screenNumber = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  ConfigurationResponse config;

  void initState() {
    fetchConfigurations().then((value) => {setState(() => config = value)});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<NavObject> navItems = [
      NavObject(
        screen: MoviesScreen(config, _scaffoldKey),
        navIcon: Icon(
          AppIcons.cinema,
          size: 20,
        ),
        title: Text(
          'MOVIES',
          style: TextStyle(fontSize: 11, height: 2),
        ),
      ),
      NavObject(
        screen: MoviesSearchScreen(config),
        navIcon: Icon(
          AppIcons.search,
          size: 20,
        ),
        title: Text(
          'SEARCH',
          style: TextStyle(fontSize: 11, height: 2),
        ),
      ),
    ];
    return Scaffold(
      drawer: CustomDrawer(),
      key: _scaffoldKey,
      body: Stack(
        children: [
          navItems[_screenNumber].screen,
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.green_sheen,
                    blurRadius: 20,
                    spreadRadius: 5,
                    offset: Offset(0, 3),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  // elevation: 2,
                  selectedItemColor: AppColors.green_ming,
                  unselectedItemColor: AppColors.green_sheen,
                  type: BottomNavigationBarType.fixed,
                  items: navItems
                      .map((navItem) => BottomNavigationBarItem(
                            icon: navItem.navIcon,
                            title: navItem.title,
                          ))
                      .toList(),
                  currentIndex: _screenNumber,
                  onTap: (i) => setState(() {
                    _screenNumber = i;
                  }),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavObject {
  Widget screen;
  Icon navIcon;
  Text title;

  NavObject({
    this.screen,
    this.navIcon,
    this.title,
  });
}
