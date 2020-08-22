import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviesplus/models/movie_model.dart';
import 'package:moviesplus/screens/movies/widgets/category.dart';
import 'package:moviesplus/services/movies_service.dart';
import 'package:moviesplus/utils/app_icons.dart';
import 'package:moviesplus/utils/essentials.dart';

class MoviesScreen extends StatefulWidget {
  static const routeName = '/movies';

  final config;

  final scaffoldKey;

  MoviesScreen(this.config, this.scaffoldKey);
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  ScrollController scrollController;
  Future<MovieResponse> popularMovies;
  Future<MovieResponse> topRatedMovies;
  Future<MovieResponse> upcomingMovies;

  void initState() {
    popularMovies = fetchPopularMovies();
    topRatedMovies = fetchTopRatedMovies();
    upcomingMovies = fetchUpcomingMovies();
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
              'MOVIES',
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
                // child: Center(
                //     child: Image.asset('assets/images/moviespluslogo.png')),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: FutureBuilder(
              future:
                  Future.wait([popularMovies, topRatedMovies, upcomingMovies]),
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
                          MovieCategory(
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
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          AppColors.green_ming),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
