import 'dart:convert';

import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:btcturk_training/src/model/BtcSources.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

String apiSourceLink =
    //'https://newsapi.org/v2/top-headlines/sources?language=en&apiKey=' +
    //  dotenv.env['API_KEY'].toString();
    'https://newsapi.org/v2/sources?language=en&apiKey=' +
        dotenv.env['API_KEY'].toString();

String apiLinkGetter(String categoryName) {
  switch (categoryName) {
    case "general":
      return 'https://newsapi.org/v2/sources?language=en&category=general&apiKey=' +
          dotenv.env['API_KEY'].toString();

    case "business":
      return 'https://newsapi.org/v2/sources?language=en&category=business&apiKey=' +
          dotenv.env['API_KEY'].toString();

    case "entertainment":
      return 'https://newsapi.org/v2/sources?language=en&category=entertainment&apiKey=' +
          dotenv.env['API_KEY'].toString();

    case "health":
      return 'https://newsapi.org/v2/sources?language=en&category=health&apiKey=' +
          dotenv.env['API_KEY'].toString();

    case "science":
      return 'https://newsapi.org/v2/sources?language=en&category=science&apiKey=' +
          dotenv.env['API_KEY'].toString();

    case "sports":
      return 'https://newsapi.org/v2/sources?language=en&category=sports&apiKey=' +
          dotenv.env['API_KEY'].toString();

    case "technology":
      return 'https://newsapi.org/v2/sources?language=en&category=technology&apiKey=' +
          dotenv.env['API_KEY'].toString();

    default:
      return 'https://newsapi.org/v2/sources?language=en&apiKey=' +
          dotenv.env['API_KEY'].toString();
  }
}

//haber kaynakları & en

class ApiDatGet {
  static Future<BtcData?> apiRequest(String apiLink) async {
    var client = http.Client();

    var uriIE = Uri.parse(apiLink);

    var response = await client.get(uriIE);

    if (response.statusCode == 200) {
      var btcData = btcDataFromJson(response.body);

      return btcData;
    } else {
      //return BtcData();
    }
  }

  static Future<BtcData?> apiRequestWithSourceFilter(String companyId) async {
    var client = http.Client();

    var uriIE = Uri.parse(
        'https://newsapi.org/v2/top-headlines?sources=$companyId&sortBy=publishedAt&apiKey=f91c240eaaf24a308d753c8aac799dbb');

    var response = await client.get(uriIE);

    if (response.statusCode == 200) {
      var btcData = btcDataFromJson(response.body);

      return btcData;
    } else {
      //return BtcData();
    }
  }

  static Future<BtcSources?> apiSourceRequest() async {
    var client = http.Client();

    var uriIE = Uri.parse(apiSourceLink);

    var response = await client.get(uriIE);

    if (response.statusCode == 200) {
      var btcData = btcSourcesFromJson(response.body);

      return btcData;
    } else {
      print(response.statusCode);
      //return BtcData();
    }
  }

  static Future<BtcSources?> apiSourceWithCategoryRequest(
      List<String> categoryList) async {
    var sourceList = <SourceModel>[];

    var sourceData = BtcSources();

    var client = http.Client();

    if (categoryList.isEmpty) {
      var uriIE = Uri.parse(apiSourceLink);

      var response = await client.get(uriIE);

      if (response.statusCode == 200) {
        var btcData = btcSourcesFromJson(response.body);

        return btcData;
      } else {
        print(response.statusCode);
        //return BtcData();
      }
    } else {
      for (var element in categoryList) {
        var uriIE = Uri.parse(apiLinkGetter(element));
        var response = await client.get(uriIE);

        if (response.statusCode == 200) {
          var btcData = btcSourcesFromJson(response.body);
          sourceList.addAll(btcData.sources!);
        } else {
          print(response.statusCode);
        }
      }
      sourceData.status = "";
      sourceData.sources = sourceList;

      return sourceData;
    }


  }



}



