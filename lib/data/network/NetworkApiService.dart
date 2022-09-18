import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:provider_folderstructure/data/app_exception.dart';
import 'package:provider_folderstructure/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiServices {
  //FOR => GET API
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //FOR => POST API
  @override
  Future getPostApiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  // To check the StatuCode its valid or not
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responejson = jsonDecode(response.body);
        return responejson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw BadRequestException(response.body.toString());
      case 500:
        throw BadRequestException(response.body.toString());

      default:
        throw FetchDataException(
            "Erro accure with servier${response.statusCode}");
    }
  }
}
