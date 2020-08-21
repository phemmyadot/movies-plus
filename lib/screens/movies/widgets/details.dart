import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviesplus/models/movie_model.dart';
import 'package:moviesplus/services/movies_service.dart';
import 'package:moviesplus/utils/essentials.dart';
import 'package:moviesplus/widgets/custom_drawer.dart';
import 'package:moviesplus/widgets/custom_input.dart';
import 'package:moviesplus/widgets/video_player.dart';

class MovieDetails extends StatefulWidget {
  static const routeName = '/movie-detail';

  MovieDetails();
  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  ScrollController scrollController;
  Future<MovieDetail> currentMovie;
  int id;
  var config;

  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        ScreenArguments args = ModalRoute.of(context).settings.arguments;
        id = args.id;
        currentMovie = fetchMovie(args.id);
        config = args.config;
      });
    });
    super.initState();
  }

  void dispose() {
    super.dispose();
  }

  bool disableSpinner = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: currentMovie,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            return Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.48,
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 30.0, left: 30.0),
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.red)),
                        // child: VideoPlayerScreen(id: id),
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.31,
                        child: Image.asset("assets/images/background.png",
                            fit: BoxFit.cover),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            right: MediaQuery.of(context).size.width * 0.25,
                            left: MediaQuery.of(context).size.width * 0.25),
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.15),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Card(
                          elevation: 10,
                          child: Padding(
                              padding: const EdgeInsets.all(0.0),
                              child: Image.network(
                                '${config.baseUrl}w300${snapshot.data.posterPath}',
                                fit: BoxFit.cover,
                              )),
                        ),
                      ),
                    ],
                  ),
                  // TasksMenu(),
                  // AddNewButton('TASK')
                ],
              ),
            );
          }
          return Container(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Center(child: CircularProgressIndicator()));
        },
      ),
      drawer: CustomDrawer(),
    );
  }
}

class ScreenArguments {
  final int id;
  final config;

  ScreenArguments(this.id, this.config);
}
