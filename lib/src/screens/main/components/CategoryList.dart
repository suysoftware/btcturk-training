import 'package:btcturk_training/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';



class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  var categoryList = <String>[];
  var categoryButtonList = <Widget>[];
  @override
  void initState() {
    super.initState();

    categoryList.addAll(["General", "Spot", "Future", "NFT"]);

    for (var i = 0; i < categoryList.length; i++) {
      categoryButtonList.add(categoryButton(categoryList[i], false, i));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 12.0),
      child: Container(
        height: 47,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categoryButtonList.length,
          itemBuilder: (context, index) {
            return categoryButtonList[index];
          },
        ),
      ),
    );
  }

  Widget categoryButton(String categoryName, bool buttonIsActive, int index) {
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
            setState(() {
              categoryButtonList[index] =
                  categoryButton(categoryName, !buttonIsActive, index);
            });
          },
          child: Row(
            children: [
              buttonIsActive
                  ? SvgPicture.asset('assets/svg/done_vector.svg')
                  : SvgPicture.asset('assets/svg/add_vector.svg'),

              SizedBox(
                width: 5.0,
              ),
              Text(categoryName),
            ],
          ),
        ),
      ),
    );
  }
}
