//PACKAGES
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//SERVICES
import 'package:btcturk_training/src/services/api_data_get.dart';

//CUBİT
import 'package:btcturk_training/src/bloc/CategoryFilterLinkCubit.dart';

//MODELS
import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:btcturk_training/src/model/BtcSources.dart';

//CONSTANTS
import 'package:btcturk_training/src/constants/app_constants.dart';

//COMPONENTS
import 'package:btcturk_training/src/screens/source_page/components/SourceListView.dart';
import 'package:btcturk_training/src/screens/source_page/components/slider/AddReadListButton.dart';
import 'package:btcturk_training/src/screens/source_page/components/slider/SliderDots.dart';
import 'package:btcturk_training/src/screens/source_page/components/SourceCategoryTextRow.dart';
import 'package:btcturk_training/src/screens/source_page/components/SourceFeedCard.dart';
import 'package:btcturk_training/src/widgets/FeedDescriptionRichText.dart';
import 'package:btcturk_training/src/widgets/FeedTitleText.dart';
import 'package:btcturk_training/src/widgets/ImageBorderWidget.dart';
import 'package:btcturk_training/src/widgets/btc_turk_logo.dart';
import 'package:btcturk_training/src/widgets/circular_progress.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SourceScreen extends StatefulWidget {
  final String sourceName;
  SourceScreen({required this.sourceName});

  @override
  State<SourceScreen> createState() => _SourceScreenState();
}

class _SourceScreenState extends State<SourceScreen> {
  late Timer _timer;
  int _current = 0;
  String sliderTitleText = "";
  String sliderDescriptionText = "";

  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

    if (this.mounted) {
      // Every 60 seconds refresh data
      _timer = new Timer.periodic(
          Duration(seconds: 60),
          (Timer timer) => {
                setState(() {
                  print('ss');
                })
              });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<BtcData?>(
        future: ApiDatGet.apiRequestWithSourceFilter(widget.sourceName),
        builder: (context, snap) {
          if (snap.hasData) {
            var snapData = snap.data!;

            return Container(
              child: Column(
                children: [
                  BtcTurkLogo(),
                  Container(
                    decoration: BoxDecoration(color: Color(0xffF4F7FF)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 15.0, vertical: 30.0),
                      child: Column(
                        children: [
                          corouselSliderBuild([
                            snapData.articles![0],
                            snapData.articles![1],
                            snapData.articles![2]
                          ]),
                          SizedBox(
                            height: 15.0,
                          ),
                          FeedTitleText(
                              titleText: sliderTitleText == ""
                                  ? snapData.articles![0].title
                                      .toString()
                                      .substring(0, 10)
                                  : sliderTitleText,
                              titleTextStyle:
                                  StyleConstants.sourceScreenTitleStyle),
                          SizedBox(
                            height: 5.0,
                          ),
                          FeedDescriptionRichText(
                              descriptionText: sliderDescriptionText == ""
                                  ? snapData.articles![0].description.toString()
                                  : sliderDescriptionText,
                              descriptionTextStyle:
                                  StyleConstants.sourceScreenBodyStyle),
                          SizedBox(
                            height: 5.0,
                          ),
                          AddReadListButton(
                              article: snapData.articles![_current]),
                          SizedBox(
                            height: 5.0,
                          ),
                          SliderDots(widgetList: [
                            ImageBorderWidget(article: snapData.articles![0]),
                            ImageBorderWidget(article: snapData.articles![1]),
                            ImageBorderWidget(article: snapData.articles![2])
                          ], controller: _controller, current: _current),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SourceCategoryTextRow(
                    categoryList: context.read<CategoryFilterLinkCubit>().state,
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  SourceListView(articles: snapData.articles!)
                ],
              ),
            );
          } else {
            return CircularProgress();
          }
        },
      ),
    );
  }

  Widget corouselSliderBuild(List<Article> slideArticleList) {
    return CarouselSlider(
        items: [
          ImageBorderWidget(article: slideArticleList[0]),
          ImageBorderWidget(article: slideArticleList[1]),
          ImageBorderWidget(article: slideArticleList[2])
        ],
        carouselController: _controller,
        options: CarouselOptions(
          height: 227.85,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 5),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;

              sliderTitleText = slideArticleList[index].title!.substring(0, 10);
              sliderDescriptionText = slideArticleList[index].description!;
            });
          },
          scrollDirection: Axis.horizontal,
        ));
  }
}
