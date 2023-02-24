import 'package:btcturk_training/src/bloc/CategoryFilterLinkCubit.dart';
import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:btcturk_training/src/model/BtcSources.dart';
import 'package:btcturk_training/src/screens/main/components/FeedCard.dart';
import 'package:btcturk_training/src/services/api_data_get.dart';
import 'package:btcturk_training/src/widgets/circular_progress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_constants.dart';

class FeedList extends StatefulWidget {
  const FeedList({super.key});

  @override
  State<FeedList> createState() => _FeedListState();
}

class _FeedListState extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryFilterLinkCubit, List<String>>(
        builder: (context, snapshotBloc) {
      return FutureBuilder<BtcSources?>(
        future: ApiDatGet.apiSourceWithCategoryRequest(snapshotBloc),
        builder: (context, snap) {
          if (snap.hasData) {
            var snapData = snap.data!;



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
                      itemCount: snapData.sources!.length,
                      itemBuilder: (context, index) {
                        return snapData.sources!.isNotEmpty
                            ? FeedCard(source: snapData.sources![index])
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
    });
  }
}
