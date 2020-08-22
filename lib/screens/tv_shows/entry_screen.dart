import 'package:flutter/material.dart';
import 'package:moviesplus/models/config_model.dart';
import 'package:moviesplus/screens/tv_shows/search_screen.dart';
import 'package:moviesplus/screens/tv_shows/tv_shows_screen.dart';
import 'package:moviesplus/services/config_service.dart';
import 'package:moviesplus/utils/app_icons.dart';
import 'package:moviesplus/utils/essentials.dart';
import 'package:moviesplus/widgets/custom_drawer.dart';

class TvShowsEntryScreen extends StatefulWidget {
  static const routeName = '/tv-shows-entry';
  @override
  _TvShowsEntryScreenState createState() => _TvShowsEntryScreenState();
}

class _TvShowsEntryScreenState extends State<TvShowsEntryScreen> {
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
        screen: TvShowsScreen(config, _scaffoldKey),
        navIcon: Icon(
          AppIcons.cinema,
          size: 20,
        ),
        title: Text(
          'TV SHOWS',
          style: TextStyle(fontSize: 11, height: 2),
        ),
      ),
      NavObject(
        screen: TvShowsSearchScreen(config),
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
                  backgroundColor: AppColors.offWhite,
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
      drawer: CustomDrawer(),
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
