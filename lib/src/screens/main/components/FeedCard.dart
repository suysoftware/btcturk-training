import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:btcturk_training/src/model/BtcSources.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FeedCard extends StatefulWidget {
  SourceModel source;
  FeedCard({required this.source});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 0.0,
          surfaceTintColor: Colors.transparent,
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, "/Source",
                  arguments: widget.source.id);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 80.w,
                    child: Column(
                      children: [
                        feedResourceTextBuild(widget.source.name.toString()),
                        SizedBox(
                          height: 10.0,
                        ),
                        feedDescriptionTextBuild(
                            widget.source.description.toString()),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.0,
                  ),
                  SizedBox(
                      height: 16.0,
                      width: 16.0,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                      ))
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

  Widget feedResourceTextBuild(String feedResource) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          feedResource,
          style: StyleConstants.mainScreenTitleStyle,
        ),
      ],
    );
  }

  Widget feedDescriptionTextBuild(String description) {
    return RichText(
        text: TextSpan(
            text: description, style: StyleConstants.mainScreenBodyStyle));
  }
}
