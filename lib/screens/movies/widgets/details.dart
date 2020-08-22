import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:moviesplus/models/movie_model.dart';
import 'package:moviesplus/services/movies_service.dart';
import 'package:moviesplus/utils/essentials.dart';
import 'package:moviesplus/widgets/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

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
        builder: (context, AsyncSnapshot<MovieDetail> snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
                color: AppColors.offWhite,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.48,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0, left: 30.0),
                        child: Container(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 35.0,
                              ),
                              Text(
                                snapshot.data.overview,
                                style: AppTextStyles.bodyText,
                                textAlign: TextAlign.justify,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Divider(
                                color: AppColors.green_ming,
                                height: 1,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Genres:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      snapshot.data.genres
                                          .map((entry) => entry.name)
                                          .join(', '),
                                      style: AppTextStyles.bodyText,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Release Date:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      DateFormat('MMMM dd, yyyy').format(
                                          DateTime.parse(
                                              snapshot.data.releaseDate)),
                                      style: AppTextStyles.bodyText,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Status:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      snapshot.data.status,
                                      style: AppTextStyles.bodyText,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Rating:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      snapshot.data.rating.toString(),
                                      style: AppTextStyles.bodyText,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              snapshot.data.link == ""
                                  ? Container()
                                  : Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'External Link:',
                                          style: AppTextStyles.bodyText,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          onPressed: () async {
                                            if (await canLaunch(
                                                snapshot.data.link)) {
                                              await launch(snapshot.data.link);
                                            } else {
                                              throw 'Could not launch $snapshot.data.link';
                                            }
                                          },
                                          icon: Icon(
                                            Icons.open_in_new,
                                            color: AppColors.green_ming,
                                            size: 18,
                                          ),
                                        ),
                                      ],
                                    ),
                            ],
                          ),
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
                          width: double.infinity,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.07,
                              left: MediaQuery.of(context).size.height * 0.02),
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: AppColors.offWhite,
                                  size: 28,
                                ),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
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
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }
          return Container(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: CircularProgressIndicator(
                valueColor:
                    new AlwaysStoppedAnimation<Color>(AppColors.green_ming),
              ),
            ),
          );
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
