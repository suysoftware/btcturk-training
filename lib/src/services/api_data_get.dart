import 'dart:convert';

import 'package:btcturk_training/src/model/BtcData.dart';
import 'package:http/http.dart' as http;

String apiLink =
    'https://newsapi.org/v2/top-headlines?language=en&apiKey=f91c240eaaf24a308d753c8aac799dbb';

class ApiDatGet {
  static Future<BtcData?> apiRequest() async {
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
}
