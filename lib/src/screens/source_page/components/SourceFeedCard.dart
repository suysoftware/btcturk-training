import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:btcturk_training/src/model/BtcSources.dart';
import 'package:btcturk_training/src/screens/source_page/components/slider/AddReadListButton.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class SourceFeedCard extends StatefulWidget {
  Article article;
  SourceFeedCard({required this.article});

  @override 


  State<SourceFeedCard> createState() => _SourceFeedCardState();
}

class _SourceFeedCardState extends State<SourceFeedCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0.0,
          surfaceTintColor: Colors.transparent,
          color: Colors.transparent,
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Container(
              child: Column(
                children: [
                  sourceCardInwellPart(),
                  SizedBox(
                    height: 10.0,
                  ),
                  AddReadListButton(article: widget.article)
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          "------------------------------------------------------",
          style: TextStyle(color: ColorConstants.mainListBorderStroke),
        )
      ],
    );
  }

  Widget sourceCardInwellPart() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/Detail', arguments: widget.article);
      },
      child: Column(
        children: [
          SizedBox(
            height: 227.85,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: SizedBox.fromSize(
                size: Size.infinite, //
                child: Image.network(
                  widget.article.urlToImage.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          feedResourceTextBuild(
            widget.article.title.toString().substring(0, 7),
          ),
        ],
      ),
    );
  }//

  Widget feedResourceTextBuild(String feedResource) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(feedResource, style: StyleConstants.sourceScreenTitleStyle),
      ],
    );
  }
}
