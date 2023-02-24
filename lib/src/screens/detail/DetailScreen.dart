import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:btcturk_training/src/screens/source_page/components/slider/AddReadListButton.dart';
import 'package:btcturk_training/src/widgets/FeedTitleText.dart';
import 'package:btcturk_training/src/widgets/ImageBorderWidget.dart';
import 'package:btcturk_training/src/widgets/btc_turk_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class DetailScreen extends StatefulWidget {
  final Article article;
  DetailScreen({required this.article});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          BtcTurkLogo(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      FeedTitleText(
                          titleText:
                              widget.article.title.toString().substring(0, 15),
                          titleTextStyle: StyleConstants.detailScreenTitleStyle)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  child: ImageBorderWidget(
                    article: widget.article,
                    areWeInDetail: true,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: RichText(
                      maxLines: 15,
                      text: TextSpan(
                          text: widget.article.content,
                          style: StyleConstants.detailScreenBodyStyle)),
                ),
                SizedBox(
                  height: 15.0,
                ),
                AddReadListButton(
                  article: widget.article,
                ),
                SizedBox(
                  height: 45.0,
                ),
                Row(
                  children: [
                    goBackButtonBuild(),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget goBackButtonBuild() {
    return TextButton(
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(ColorConstants.themeDarkBlue)),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          '< Go to Back',
          style: StyleConstants.detailScreenBackButtonTextStyle,
        ));
  }
}
