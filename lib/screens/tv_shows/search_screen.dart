import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:moviesplus/models/tv_show_model.dart';
import 'package:moviesplus/services/tv_shows_service.dart';
import 'package:moviesplus/utils/essentials.dart';
import 'package:moviesplus/widgets/custom_drawer.dart';
import 'package:moviesplus/widgets/custom_input.dart';

class TvShowsSearchScreen extends StatefulWidget {
  final config;
  TvShowsSearchScreen(this.config);
  @override
  _TvShowsSearchScreenState createState() => _TvShowsSearchScreenState();
}

class _TvShowsSearchScreenState extends State<TvShowsSearchScreen> {
  ScrollController scrollController;
  TextEditingController _controller = TextEditingController();
  StreamController _searchResultsController;
  Future<TvShowResponse> searchedMovies;

  void initState() {
    _searchResultsController = new StreamController.broadcast();
    super.initState();
  }

  void dispose() {
    _searchResultsController.close();
    super.dispose();
  }

  bool disableSpinner = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.22,
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 30.0, left: 30.0, bottom: 50.0),
                child: StreamBuilder(
                  stream: _searchResultsController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return new Container();
                    } else if (snapshot.data == 1) {
                      return Container(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: Center(child: CircularProgressIndicator()));
                    } else if (!snapshot.hasData ||
                        snapshot.data.results.length == 0) {
                      return new Center(
                        child: Text("No search result",
                            style: AppTextStyles.bodyText),
                      );
                    } else if (snapshot.hasData) {
                      return GridView.count(
                        childAspectRatio: itemWidth / itemHeight,
                        crossAxisCount: 2,
                        children: [
                          for (int i = 0; i < snapshot.data.results.length; i++)
                            Container(
                              margin: const EdgeInsets.only(bottom: 9.0),
                              child: GestureDetector(
                                onTap: () => null,
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 250,
                                        width: 200,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: snapshot.data.results[i]
                                                          .posterPath !=
                                                      null
                                                  ? NetworkImage(
                                                      '${widget.config.baseUrl}w300${snapshot.data.results[i].posterPath}')
                                                  : AssetImage(
                                                      'assets/images/no-image.png'),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          child: Container(),
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data.results[i].title,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyles.body2Text,
                                              ),
                                              Text(
                                                snapshot.data.results[i]
                                                            .releaseDate !=
                                                        null
                                                    ? snapshot.data.results[i]
                                                        .releaseDate
                                                        .toString()
                                                    : '',
                                                overflow: TextOverflow.ellipsis,
                                                style: AppTextStyles.bodyText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      );
                    }
                    return Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: Center(child: CircularProgressIndicator()));
                  },
                ),
              ),
            ),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: Image.asset("assets/images/background.png",
                      fit: BoxFit.cover),
                ),
                Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.2,
                    child: Center(
                      child: Text(
                        'SEARCH MOVIES',
                        style: AppTextStyles.heading1White,
                      ),
                    )),
                Container(
                  padding: EdgeInsets.only(right: 30.0, left: 30.0),
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.15),
                  width: double.infinity,
                  child: Card(
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Form(
                        child: CustomInput(
                            _controller,
                            (query) => {
                                  if (query == '')
                                    {
                                      setState(() => disableSpinner = true),
                                      _searchResultsController.sink.add(null),
                                    }
                                  else
                                    {
                                      setState(() => disableSpinner = false),
                                      _searchResultsController.sink.add(1),
                                      searchTvShows(query).then((value) =>
                                          _searchResultsController.sink
                                              .add(value))
                                    }
                                }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // TasksMenu(),
            // AddNewButton('TASK')
          ],
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
