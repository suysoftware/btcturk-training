import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:btcturk_training/src/screens/main/components/FeedCard.dart';
import 'package:btcturk_training/src/services/api_data_get.dart';
import 'package:btcturk_training/src/widgets/circular_progress.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_constants.dart';

class FeedList extends StatefulWidget {
  const FeedList({super.key});

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<BtcData?>(
      future: ApiDatGet.apiRequest(),
      builder: (context, snap) {
        if (snap.hasData) {
          var snapData = snap.data!;
          for (var i = 0; i < snapData.articles!.length; i++) {
            print(snapData.articles![i].source!.name.toString());
            print(snapData.status);
          }

          return Flexible(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            strokeAlign: StrokeAlign.inside,
                            width: 1.0,
                            color: ColorConstants.mainListBorderStroke))),
                child: ListView.builder(
                    reverse: false,
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.values.last,
                    itemCount: snapData.articles!.length,
                    itemBuilder: (context, index) {
                      return snapData.articles!.isNotEmpty
                          ? FeedCard(article: snapData.articles![index])
                          : const SizedBox();
                    }),
              ),
            ),
          );
        } else {
          return CircularProgress();
        }
      },
    );
  }
}
