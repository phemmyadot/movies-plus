import 'package:flutter/material.dart';
import 'package:moviesplus/models/config_model.dart';
import 'package:moviesplus/models/tv_show_model.dart';
import 'package:moviesplus/screens/tv_shows/widgets/details.dart';
import 'package:moviesplus/utils/app_icons.dart';
import 'package:moviesplus/utils/essentials.dart';

class TvShowsCategory extends StatefulWidget {
  final title;

  final TvShowResponse data;

  final categoryId;

  final ConfigurationResponse config;

  TvShowsCategory({this.title, this.data, this.categoryId, this.config});

  @override
  _TvShowsCategoryState createState() => _TvShowsCategoryState();
}

class _TvShowsCategoryState extends State<TvShowsCategory> {
  @override
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: new EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: EdgeInsets.only(top: 20.0),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Text(
                  widget.title,
                  style: AppTextStyles.body2Text,
                ),
                SizedBox(height: 10.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int x = 0; x < widget.data.results.length; x++)
                        GestureDetector(
                          onTap: () =>Navigator.of(context).pushNamed(TvShowDetails.routeName, arguments: ScreenArguments(widget.data.results[x].id, widget.config)),
                          child: Card(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 250,
                                  width: 200,
                                  child: Container(
                                    decoration: widget.config != null
                                        ? BoxDecoration(
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  '${widget.config.baseUrl}w300${widget.data.results[x].posterPath}'),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : BoxDecoration(),
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
                                          widget.data.results[x].title,
                                          overflow: TextOverflow.ellipsis,
                                          style: AppTextStyles.body2Text,
                                        ),
                                        Text(
                                            widget.data.results[x].releaseDate
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: AppTextStyles.bodyText),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FlatButton.icon(
                      label: Text(
                        'See More',
                        style: AppTextStyles.bodyText.copyWith(fontSize: 12),
                      ),
                      icon: Icon(
                        AppIcons.more,
                        color: AppColors.green_ming,
                        size: 14,
                      ),
                      onPressed: () => print(widget.categoryId),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
