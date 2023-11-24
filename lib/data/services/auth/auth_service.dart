import 'dart:async';
import 'package:flutter_redux_bp/data/api/api_client.dart';
import 'package:flutter_redux_bp/data/services/api_service.dart';
import 'package:flutter_redux_bp/models/models.dart';

class AuthService extends ApiService {
  AuthService({required ApiClient client}) : super(client: client);

//************************************ log-in *********************************//
  Future<Map<String, dynamic>?> loginWithPassword(
      {Map<String, dynamic>? objToApi}) async {
    final ApiResponse<ApiSuccess> res = await client!.callJsonApi<ApiSuccess>(
        method: Method.post,
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        path: '/user_management/customer/sign_in',
        body: objToApi);
    if (res.isSuccess) {
      return {'customer': res.resData?.user, 'token': res.resData?.token};
    } else {
      throw true;
    }
  }
}
