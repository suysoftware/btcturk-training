import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:btcturk_training/src/screens/source_page/components/SourceFeedCard.dart';
import 'package:flutter/material.dart';

class SourceListView extends StatelessWidget {
  final List<Article> articles;
  const SourceListView({required this.articles});

  @override
  Widget build(BuildContext context) {
    print(articles.length);
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: ListView.builder(
            reverse: false,
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.values.last,
            itemCount:
                articles.length > 3 ? (articles.length - 4) : (articles.length),
            itemBuilder: (context, index) {
              return articles.isNotEmpty
                  ? SourceFeedCard(
                      article: articles.length > 3
                          ? articles[index + 3]
                          : articles[index])
                  : const SizedBox();
            }),
      ),
    );
  }
}
