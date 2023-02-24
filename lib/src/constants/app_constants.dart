import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ColorConstants {
  static const Color themeDarkBlue = Color(0xff052C54);
  static const Color textLightBlue = Color(0xff7C89A0);
  static const Color textGrey = Color(0xffDBE5FF);
  static const Color themeWhite = Color(0xffFFFFFF);
  static const Color mainListBorderStroke = Color(0xffDBE5FF);
  static const Color feedTitleColor = Color(0xff5325EA);
  static const Color softBlack = Color(0xff000000);
}

class StyleConstants {
  static const TextStyle readListStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w400,
      fontSize: 11.0,
      // height: 13.0,
      color: ColorConstants.themeDarkBlue);
  static const TextStyle dateStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w400,
      fontSize: 12.0,

      //height: 15.0,
      color: ColorConstants.textLightBlue);

  static const TextStyle mainScreenTitleStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w700,
      fontSize: 18.0,
      //  height: 22.0,
      color: ColorConstants.feedTitleColor);

  static const TextStyle mainScreenBodyStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      //  height: 14.52,
      color: ColorConstants.textLightBlue);

  static const TextStyle mainScreenCategoryButtonActiveTextStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      // height: 16.94,
      color: ColorConstants.themeWhite);

  static const TextStyle mainScreenCategoryButtonPassiveTextStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      //height: 16.94,
      color: ColorConstants.themeDarkBlue);

  static const TextStyle sourceScreenTitleStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w700,
      fontSize: 16.0,
      //height: 19.36,
      color: ColorConstants.themeDarkBlue);

  static const TextStyle sourceScreenBodyStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      // height: 14.52,
      color: ColorConstants.textLightBlue);

  static const TextStyle sourceScreenReadListButtonTextStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w400,
      fontSize: 11.0,
      //height: 13.31,
      color: ColorConstants.themeDarkBlue);

  static const TextStyle sourceScreenCategoryTextStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w700,
      fontSize: 22.0,
      //height: 26.63,
      color: ColorConstants.softBlack);

  static const TextStyle sourceScreenBackButtonTextStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w600,
      fontSize: 12.0,
      //  height: 14.52,
      color: ColorConstants.themeWhite);

  static const TextStyle detailScreenTitleStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w700,
      fontSize: 24.0,
      //  height: 29.05,
      color: ColorConstants.themeDarkBlue);

  static const TextStyle detailScreenBodyStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w400,
      fontSize: 12.0,
      //  height: 14.52,
      color: ColorConstants.textLightBlue);

  static const TextStyle detailScreenBackButtonTextStyle = TextStyle(
      fontFamily: "Inter-Regular",
      fontWeight: FontWeight.w600,
      fontSize: 14.0,
      // height: 16.94,
      color: ColorConstants.themeWhite);
}
