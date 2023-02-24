import 'package:btcturk_training/src/bloc/CategoryFilterLinkCubit.dart';
import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var categoryList = <String>[];

  @override
  void initState() {
    super.initState();

    categoryList.addAll([
      "General",
      "Business",
      "Entertainment",
      "Health",
      "Science",
      "Sports",
      "Technology"
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryFilterLinkCubit, List<String>>(
        builder: (context, snapshotBloc) {
      return Padding(
        padding: EdgeInsets.only(left: 12.0),
        child: Container(
          height: 47,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return categoryButton(
                  categoryList[index],
                  snapshotBloc.contains(categoryList[index].toLowerCase())
                      ? true
                      : false,
                  index,
                  snapshotBloc);
            },
          ),
        ),
      );
    });
  }

  Widget categoryButton(String categoryName, bool buttonIsActive, int index,
      List<String> categoryList) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: ButtonTheme(
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: buttonIsActive
                ? MaterialStateProperty.all(ColorConstants.themeDarkBlue)
                : MaterialStateProperty.all(ColorConstants.themeWhite),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0))),
          ),
          onPressed: () {
            if (categoryList.contains(categoryName.toLowerCase()) &&
                buttonIsActive == true) {
              var newList = <String>[];
              newList.addAll(categoryList);
              newList.remove(categoryName.toLowerCase());

              context.read<CategoryFilterLinkCubit>().changeLink(newList);
            } else {
              var newList = <String>[];
              newList.addAll(categoryList);
              newList.add(categoryName.toLowerCase());

              context.read<CategoryFilterLinkCubit>().changeLink(newList);
            }
          },
          child: Row(
            children: [
              buttonIsActive
                  ? SvgPicture.asset('assets/svg/done_vector.svg')
                  : SvgPicture.asset('assets/svg/add_vector.svg'),
              SizedBox(
                width: 5.0,
              ),
              Text(
                categoryName,
                style: buttonIsActive
                    ? StyleConstants.mainScreenCategoryButtonActiveTextStyle
                    : StyleConstants.mainScreenCategoryButtonPassiveTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
