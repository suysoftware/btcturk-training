import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class FirebaseApiOperations {
  static Future<bool> apiRequest(String apiLink, dynamic payLoad) async {
    var client = http.Client();

    var uriIE = Uri.parse(apiLink);
 
    String token = dotenv.env['FIREBASE_API_KEY'].toString();
    var requestHeaders = {'Authorization': token};

    var response =
        await client.put(uriIE, body: payLoad, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }


  static Future<bool> addReadListRequest( dynamic payLoad) async {
    var client = http.Client();

    var uriIE = Uri.parse(dotenv.env['API_ADD_READ_LIST_LINK'].toString());
 
    String token = dotenv.env['FIREBASE_API_KEY'].toString();
    var requestHeaders = {'Authorization': token};

    var response =
        await client.put(uriIE, body: payLoad, headers: requestHeaders);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }











}
