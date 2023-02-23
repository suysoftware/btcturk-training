import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:flutter/material.dart';

class FeedCard extends StatefulWidget {
  Article article;
  FeedCard({required this.article});

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          feedResourceTextBuild(widget.article.author.toString()),
          feedDescriptionTextBuild(widget.article.description!),
        ],
      ),
    );
  }

  Widget feedResourceTextBuild(String feedResource) {
    return Text(feedResource);
  }

  Widget feedDescriptionTextBuild(String description) {
    return RichText(text: TextSpan(text: description,style: TextStyle(color: Colors.black)));
  }
}
