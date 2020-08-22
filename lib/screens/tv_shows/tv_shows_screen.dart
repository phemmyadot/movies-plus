import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviesplus/models/tv_show_model.dart';
import 'package:moviesplus/screens/tv_shows/widgets/category.dart';
import 'package:moviesplus/services/tv_shows_service.dart';
import 'package:moviesplus/utils/app_icons.dart';
import 'package:moviesplus/utils/essentials.dart';
import 'package:moviesplus/widgets/custom_drawer.dart';

class TvShowsScreen extends StatefulWidget {
  final config;

  final scaffoldKey;

  TvShowsScreen(this.config, this.scaffoldKey);
  @override
  _TvShowsScreenState createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  ScrollController scrollController;
  Future<TvShowResponse> popularTvShows;
  Future<TvShowResponse> topRatedTvShows;
  Future<TvShowResponse> upcomingTvShows;

  void initState() {
    popularTvShows = fetchPopularTvShows();
    topRatedTvShows = fetchTopRatedTvShows();
    upcomingTvShows = fetchUpcomingTvShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
                icon: Icon(AppIcons.menu),
                onPressed: () {
                  widget.scaffoldKey.currentState.openDrawer();
                }),
            expandedHeight: 220.0,
            floating: true,
            pinned: true,
            snap: true,
            elevation: 50,
            title: Text(
              'TV SHOWS',
              style: AppTextStyles.heading1White,
            ),
            centerTitle: true,
            backgroundColor: AppColors.green_ming,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/background.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: EdgeInsets.only(
                  bottom: 20,
                  right: 40.0,
                  left: 40.0,
                  top: MediaQuery.of(context).size.height * 0.1,
                ),
                height:
                    statusBarHeight + MediaQuery.of(context).size.height * 0.1,
                child: Container(),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: Future.wait(
                  [popularTvShows, topRatedTvShows, upcomingTvShows]),
              builder: (context, snapshot) {
                if (snapshot.hasError)
                  return new Container(
                    child: Text("${snapshot.error}"),
                  );
                else if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 100.0),
                    child: Column(
                      children: [
                        for (int i = 0; i < snapshot.data.length; i++)
                          TvShowsCategory(
                            data: snapshot.data[i],
                            title: i == 0
                                ? 'Popular Movies'
                                : i == 1
                                    ? 'Top-rated Movies'
                                    : i == 2 ? 'Upcoming Movies' : '',
                            config: widget.config,
                          ),
                      ],
                    ),
                  );
                }
                return Container(
                    height: MediaQuery.of(context).size.height * 0.6,
                    child: Center(child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          AppColors.green_ming),
                    ),));
              },
            ),
          ),
        ],
      ),
    );
  }
}
