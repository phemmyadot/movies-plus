import 'package:flutter/material.dart';
import 'package:moviesplus/screens/movies/entry_screen.dart';
import 'package:moviesplus/screens/tv_shows/entry_screen.dart';
import 'package:moviesplus/utils/essentials.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  color: Theme.of(context).appBarTheme.color,
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      InkWell(
                        child: Icon(
                          Icons.close,
                          color: AppColors.offWhite,
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.85,
                  child: Center(
                    child: ListView(
                      padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.2,
                        horizontal: 60,
                      ),
                      children: <Widget>[
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(MoviesEntryScreen.routeName);
                          },
                          title: Text("MOVIES",
                              style: AppTextStyles.headline3White),
                        ),
                        ListTile(
                          onTap: () {
                            Navigator.of(context)
                                .pushReplacementNamed(TvShowsEntryScreen.routeName);
                          },
                          title: Text("TV SHOWS",
                              style: AppTextStyles.headline3White),
                        ),
                        ListTile(
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushReplacementNamed(TvShowsEntryScreen.routeName);
                          },
                          title: Text("MY LIST",
                              style: AppTextStyles.headline3White),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
