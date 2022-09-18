import 'package:provider_folderstructure/data/network/BaseApiServices.dart';
import 'package:provider_folderstructure/data/network/NetworkApiService.dart';

import '../resources/app_url.dart';

class AuthRepository {
  final BaseApiServices _apiServices = NetworkApiService();

  Future<dynamic> loginAPi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrl.loginUrl, data);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> registorAPi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
