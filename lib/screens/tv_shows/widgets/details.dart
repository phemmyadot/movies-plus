import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:moviesplus/models/tv_show_model.dart';
import 'package:moviesplus/services/tv_shows_service.dart';
import 'package:moviesplus/utils/essentials.dart';
import 'package:moviesplus/widgets/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:moviesplus/widgets/custom_expansion_tile.dart' as custom;

class TvShowDetails extends StatefulWidget {
  static const routeName = '/tv-detail';

  TvShowDetails();
  @override
  _TvShowDetailsState createState() => _TvShowDetailsState();
}

class _TvShowDetailsState extends State<TvShowDetails> {
  ScrollController scrollController;
  Future<TvShowDetail> currentShow;
  int id;
  var config;

  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        ScreenArguments args = ModalRoute.of(context).settings.arguments;
        id = args.id;
        currentShow = fetchTvShow(args.id);
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
        future: currentShow,
        builder: (context, AsyncSnapshot<TvShowDetail> snapshot) {
          if (snapshot.hasError) {
            return Container(
              child: Text(
                snapshot.error.toString(),
              ),
            );
          } else if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Container(
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
                                    'First Air Date:',
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
                                    'Last Air Date:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      DateFormat('MMMM dd, yyyy').format(
                                          DateTime.parse(
                                              snapshot.data.lastAirDate)),
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
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Last Episode:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      snapshot.data.lastEpisode == null
                                          ? 'N/A'
                                          : "Episode ${snapshot.data.lastEpisode.number} - ${snapshot.data.lastEpisode.name} - ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(snapshot.data.lastEpisode.date))}",
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
                                    'Next Episode:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      snapshot.data.nextEpisode == null
                                          ? 'N/A'
                                          : "Episode ${snapshot.data.nextEpisode.number} - ${snapshot.data.nextEpisode.name} - ${DateFormat('MMMM dd, yyyy').format(DateTime.parse(snapshot.data.nextEpisode.date))}",
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
                              SizedBox(
                                height: 20.0,
                              ),
                              _buildSeason(snapshot.data.seasons),
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
                                )),
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
              ));
        },
      ),
      drawer: CustomDrawer(),
    );
  }

  Widget _buildSeason(List<Season> episodes) {
    return Theme(
      data: ThemeData().copyWith(cardColor: Colors.transparent),
      child: Container(
        child: Column(
          children: <Widget>[
            ...episodes
                .where((episode) => episode.seasonNumber != 0)
                .map(
                  (Season season) => Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: custom.ExpansionTile(
                      iconColor: AppColors.green_ming,
                      headerBackgroundColorStart: AppColors.green_honeydraw,
                      headerBackgroundColorEnd: AppColors.green_nyanza,
                      shadowColor: AppColors.green_sheen,
                      title: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.1),
                        child: Text(
                          season.name,
                          textAlign: TextAlign.center,
                          style: AppTextStyles.headline2White
                              .copyWith(color: AppColors.green_ming),
                        ),
                      ),
                      initiallyExpanded: false,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(bottom: 20),
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 15.0,
                              ),
                              Text(
                                season.overview,
                                style: AppTextStyles.bodyText,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Realeased Year:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      DateFormat('yyyy')
                                          .format(DateTime.parse(season.date)),
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
                                    'Number of Episodes:',
                                    style: AppTextStyles.bodyText,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      season.episodeCount.toString(),
                                      style: AppTextStyles.bodyText,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }
}

class ScreenArguments {
  final int id;
  final config;

  ScreenArguments(this.id, this.config);
}
