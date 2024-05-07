import 'dart:convert';
import 'dart:io';

import 'package:mvvm/data/app_excaption.dart';
import 'package:mvvm/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm/utils/utiles.dart';

class NetworkApiService extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }

    return responseJson;
  }

  @override
  Future getPostApiReponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      final response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
      Utils.toastMessage("login succesfully");
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }

    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestExceptions(response.body.toString());
      case 400:
        throw UnauthorisedExceptions(response.body.toString());
      case 500:
      default:
        throw FetchDataExceptions(
            'Error occured while communication with serverwith status code${response.statusCode}');
    }
  }
}
